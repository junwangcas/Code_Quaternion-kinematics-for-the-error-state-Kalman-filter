function [q] = conjugate_q( p )
q = zeros(4,1)';
q(1) = p(1);
q(2:4) = -p(2:4);
end

