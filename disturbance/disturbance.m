%model params
mass = 1.0;
inertia = eye(3);

%controller params
K = eye(6)*25;
Sig = eye(6);

%controller input
pos_d = [1, 1, 1]';
att_d = [pi/12, pi/4, pi/6]';

pos_ini = [0, 0, 0]';
att_ini = [0, 0, 0]';