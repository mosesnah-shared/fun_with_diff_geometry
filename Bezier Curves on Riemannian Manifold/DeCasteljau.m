function [ interp_points ] = DeCasteljau( points, N )
% 
% Detailed explanation goes here
%
% Arguments
% ---------
% (1) points: num_dim (nD) x num_points (nP)
%        num_dim (nD) is the dimension where the point resides
%        num_points (nP) is self-explanable
% (2) N: the number of points for the interpolation
%        It is good for N to be sufficiently larger than the number of points (nP)

% points should be a 2D array
assert( ismatrix( points ) && ndims( points ) == 2 );

[ nD, nP ] = size( points );

% Assert that the number of points should be sufficiently large than nP
% The rule-of-thumb number is larger than 50
assert( N >= 50 );
t = linspace( 0, 1, 2 + N );

% Define the interpolated points
interp_points = zeros( nD, N );

for i = 0 : nP
   nchoosek( nP, i ) * ( 1 - t )^( nP - i ) * points( :, 1 ) 
end
    

end

