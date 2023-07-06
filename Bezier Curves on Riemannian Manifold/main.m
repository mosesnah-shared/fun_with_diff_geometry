%% Title Bezier Curves on Riemannian Manifold
% ======================================================================== %
% Author: Moses Chong-ook Nah
%  Email: mosesnah@mit.edu
% 
%
% Description:
% 
% References:
% [1] Park, F. C., and Bahram Ravani. 
%     "Bezier curves on Riemannian manifolds and Lie groups with kinematics applications." (1995): 36-40.

%% ======================================================================== %
%% (1) Introduction a: Bezier Curves on 3D Euclidean Manifold  
% Description:
clear all; close all; clc;
points = [ 0, 0, 0; 1,0,0; 1,1, 0; 1,1,1; 0, 1, 1]' ;

Nt = 100;

my_interp1 = DeCasteljau( points, Nt, 1 );
my_interp2 = DeCasteljau( points, Nt, 2 );
my_interp3 = DeCasteljau( points, Nt, 3 );
my_interp4 = DeCasteljau( points, Nt, 4 );

f = figure( ); a = axes( 'parent', f );
hold on

% 
for i = 1 : 5
    scatter3( points( 1, i ),  points( 2, i ), points( 3, i ), 500, 'filled', 'markerfacecolor', 'r', 'markeredgecolor' ,'k' );
end

view( [ 48, 45 ] );
set( gca, 'xlim', [0,1], 'ylim',[0,1], 'zlim', [0,1] )

% Draw first order line
for i = 1 : 4
    tmp_points = my_interp1( :, :, i );
    plot3( tmp_points( 1, : ), tmp_points( 2, : ), tmp_points( 3, : ), 'o' , 'color', 'b' )
end

% Draw second order line
for i = 1 : 3
    tmp_points = my_interp2( :, :, i );
    plot3( tmp_points( 1, : ), tmp_points( 2, : ), tmp_points( 3, : ), 'o' , 'color', 'g' )
end

% Draw third order line
for i = 1 : 2
    tmp_points = my_interp3( :, :, i );
    plot3( tmp_points( 1, : ), tmp_points( 2, : ), tmp_points( 3, : ), 'o' , 'color', [0.8500, 0.3250, 0.0980])
end

for i = 1 : 1
    tmp_points = my_interp4( :, :, i );
    plot3( tmp_points( 1, : ), tmp_points( 2, : ), tmp_points( 3, : ), 'o' , 'color', [0.4940, 0.1840, 0.5560])
end
axis equal


%% (2) Application: Bezier Curves on SO(3) Manifold
clear all; close all; clc;

% Now we do this on the SO(3) manifold

w1 = [ 0; 0; 1.5 ];
w2 = [ 1; 1; 1 ]; 
w3 = [ 2; 1; 0 ];
w4 = [ 3; 1; -1 ];

theta1 = norm( w1 );
theta2 = norm( w2 );
theta3 = norm( w3 );
theta4 = norm( w4 );

points = [ 0, 0, 0; 1, 0, 0; 1, 1, 0; 1, 1, 1 ]';

R1 = expSO3( w1/theta1, theta1 );
R2 = expSO3( w2/theta2, theta2 );
R3 = expSO3( w3/theta3, theta3 );
R4 = expSO3( w4/theta4, theta4 );

R_arr = zeros( 3, 3, 4 );
R_arr( :, :, 1 ) = R1;
R_arr( :, :, 2 ) = R2;
R_arr( :, :, 3 ) = R3;
R_arr( :, :, 4 ) = R4;

f = figure( ); a = axes( 'parent', f );
axis equal
hold on;
scl = 0.3;
for i = 1 : 4
    R_tmp = scl * R_arr( :, :, i );
    quiver3( points( 1, i ), points( 2, i ),  points( 3, i ), R_tmp( 1, 1 ), R_tmp( 2, 1 ), R_tmp( 3, 1 ), 'color', 'r', 'linewidth', 5 );
    quiver3( points( 1, i ), points( 2, i ),  points( 3, i ), R_tmp( 1, 2 ), R_tmp( 2, 2 ), R_tmp( 3, 2 ), 'color', 'g', 'linewidth', 5 );
    quiver3( points( 1, i ), points( 2, i ),  points( 3, i ), R_tmp( 1, 3 ), R_tmp( 2, 3 ), R_tmp( 3, 3 ), 'color', 'b', 'linewidth', 5 ); 
end

% Run the DeCasteljau algorithm
Nt = 10;
my_interp_rot = DeCasteljau( [ w1,w2,w3,w4 ], Nt, 3 );
my_interp_pos = DeCasteljau( points, Nt, 3 );
tmp_points_rot = my_interp_rot( :, :, 1 );
tmp_points_pos = my_interp_pos( :, :, 1 );

for i = 1 : length( tmp_points_rot )
    tt  = tmp_points_rot( :, i );
    ttt = tmp_points_pos( :, i );
    R_ttmp = scl * expSO3( tt/norm( tt ), norm( tt ) ); 
    quiver3( ttt( 1 ), ttt( 2 ), ttt( 3 ), R_ttmp( 1, 1 ), R_ttmp( 2, 1 ), R_ttmp( 3, 1 ), 'color', 'r', 'linewidth', 5 );
    quiver3( ttt( 1 ), ttt( 2 ), ttt( 3 ), R_ttmp( 1, 2 ), R_ttmp( 2, 2 ), R_ttmp( 3, 2 ), 'color', 'g', 'linewidth', 5 );
    quiver3( ttt( 1 ), ttt( 2 ), ttt( 3 ), R_ttmp( 1, 3 ), R_ttmp( 2, 3 ), R_ttmp( 3, 3 ), 'color', 'b', 'linewidth', 5 ); 
end


view( [45, 45] );
set(gca, 'xlim', [-2,2], 'ylim',[-2,2], 'zlim', [-2,2] )
