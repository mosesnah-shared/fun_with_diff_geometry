function [a, b, c] = SO3_to_XYZ( R )

    err = 1e-5;
    
    % Check whether the matrix is 3x3
    assert( isall( [3, 3] == size( R ) ) );
    
    % Check whether SO(3) is an orthogonal matrix 
    assert( isall( R*R.' - eye( 3 ) < err ) );
    assert( abs( det( R ) - 1 ) < err );
    
    % Assertion that R33 and R11 are not zeros
    assert( abs( R( 1, 1 ) ) >= err );
    assert( abs( R( 3, 3 ) ) >= err );
    
   
    a = atan( -R( 2, 3 ) / R( 3, 3 ) );
    b = asin(  R( 1, 3 ) );
    c = atan( -R( 1, 2 ) / R( 1, 1 ) );


end