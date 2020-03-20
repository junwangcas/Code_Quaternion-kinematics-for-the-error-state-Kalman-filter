u = [0;0;1];
q = [0.966,0,0,0.259]';
R = quat2rotm(q');
x = [1, 0, 0]';
x_trans = R*x;

u = [0;0;1];
alpha = pi/2;

x_parrel = u*u'*x;
x_vertical = x - x_parrel;

e1 = x_vertical;
e2 = cross(u,x);

phi = 30*pi/180;
x_vertical_prim = e1*cos(phi) + e2*sin(phi);

x_trans - x_vertical_prim

