function [q3] = product_q(p, q)
[pw,px,py,pz] = deal(p(1),p(2),p(3),p(4));
[qw,qx,qy,qz] = deal(q(1),q(2),q(3),q(4));
q3 = zeros(4,1)';
q3(1) = pw*qw - px*qx - py*qy - pz*qz;
q3(2) = pw*qx + px*qw + py*qz - pz*qy;
q3(3) = pw*qy - px*qz + py*qw + pz*qx;
q3(4) = pw*qz + px*py - py*qx + pz*qw;
end

