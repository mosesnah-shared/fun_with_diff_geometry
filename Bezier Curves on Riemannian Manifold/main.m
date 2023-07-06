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
%% (1) Introduction a: Bezier Curves on 2D Euclidean Manifold  
% Description:
close all; clc;
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

%% (2) Introduction b: Bezier Curves on 3D Euclidean Manifold 


%% (3) Application c: Bezier Curves on SO(3) Manifold


