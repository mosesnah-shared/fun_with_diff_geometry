function R = XYZ_to_SO3( a, b, c )
% XYZ Euler angle to SO(3) Matrix


R = rotx( a ) * roty( b ) * rotz( c );

end