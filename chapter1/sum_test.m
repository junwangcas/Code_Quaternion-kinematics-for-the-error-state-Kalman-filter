q1 = [0.966,0,0,0.259];
q2 = q1;
q3 = q1 + q2;
q4 = q2 + q1;
q = q3 - q4;
if (sum(abs(q)) == 0)
    disp('quaterion commutative');
end


