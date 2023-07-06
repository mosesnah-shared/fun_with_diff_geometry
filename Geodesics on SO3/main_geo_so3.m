%% [Title] Geodesics on SO(3)
% ======================================================================== %
% Author: Moses Chong-ook Nah
%  Email: mosesnah@mit.edu
% 
%
% Description:
% 
% References:

%% ======================================================================== %
%% (0) Initialization
clear all; close all; clc;

%% ======================================================================== %
%% (1) Introduction a: Bezier Curves on 2D Euclidean Manifold  
% Description:

% R = exp( [w]theta );

theta1 = pi/4;
w1 = [ 0, 0, 1 ];
w1 = w1 / norm( w1 );

R1 = expSO3( w1, theta1 );

theta2 = pi/3;
w2 = [ 0, 1, 1 ];
w2 = w2 / norm( w2 );

R2 = expSO3( w2, theta2 );

N = 100;
t_arr = linspace( 0, 1, N + 2 );

R_del = R1' * R2;

theta_del = acos( ( trace( R_del ) - 1 ) / 2 );
w_del = ( R_del - R_del' ) / ( 2 * sin( theta_del ) );
w_del_vec = [ -w_del( 2, 3 ), w_del( 1, 3 ), -w_del( 1, 2 ) ];

Rt_arr = zeros( 3, 3, length( t_arr ) );

for i = 1:length( t_arr )
    Rt_arr( :, :, i ) = R1 * expSO3( w_del_vec , theta_del * t_arr( i ) );
end

%% Plotting the results

f = figure( ); a = axes( 'parent', f );

hold on
axis equal
for i = 1 : length( t_arr )
    R_tmp = Rt_arr( :, :, i );
    quiver3( a, 0, 0, 0,  R_tmp( 1, 1 ), R_tmp( 2, 1 ), R_tmp( 3, 1 ), 'color', 'r' );
    quiver3( a, 0, 0, 0,  R_tmp( 1, 2 ), R_tmp( 2, 2 ), R_tmp( 3, 2 ), 'color', 'g' );
    quiver3( a, 0, 0, 0,  R_tmp( 1, 3 ), R_tmp( 2, 3 ), R_tmp( 3, 3 ), 'color', 'b' );
    
end
