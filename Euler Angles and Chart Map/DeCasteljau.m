function [ interp_points ] = DeCasteljau( points, Nt, k )
% 
% Detailed explanation goes here
%
% Arguments
% ---------
% (1) points: 3 x num_points (nP)
%        The algorithm only works for 3D case. 
%        num_points (nP) is self-explanable
%
% (2) Nt: the number of points for the interpolation of t
%        It is good for Nt to be sufficiently larger than the number of points (nP)
%
% (3) k: The order of polynomial, should be 1 <= k <= nP - 1
%        If k = 0, then nothing changes. 

% points should be a 2D matrix
assert( ismatrix( points )  );
 
[ nD, nP ] = size( points );

% It should be 3 Dimension
assert( nD == 3 );

% Assert that Nt is sufficiently large, rule-of-thumb is more than 50
assert( Nt >= 2 );
t_arr = linspace( 0, 1, 2 + Nt );

% Assert that k is between 1 and nP-1
assert( k >= 1 && k <= nP - 1 )

% Define a 3D matrix, with 3 x length( t_arr ) x k 
interp_points = zeros( 3, length( t_arr ), nP - k );

for i = 1 : nP-k
    for j = 1 : k + 1
        interp_points( :, :, i ) = interp_points( :, :, i ) + ....
            points( :, j + ( i - 1 ) ) * nchoosek( k, j-1 ) * ( 1 - t_arr ).^( k - ( j - 1 ) ) .* t_arr.^( j - 1 );
    end
end    

end

