q1 = [0.966,0,0,0.259];
R = quat2rotm(q1);

phi =  acos((trace(R) - 1)/2)

phi_deg = phi*180/pi