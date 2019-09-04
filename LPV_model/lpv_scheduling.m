%simulation parameters
Ts=1e-3; % Sampling time 1ms
Tsim=20; % Simulation time 20s
t=0:Ts:Tsim-1*Ts;
N=Tsim/Ts;

%initialize model paramerters
mass = 1.0;
inertia = eye(3); %body-fixed inertia matrix

R = eye(3); %rotation matrix
S = eye(3); %euler to omega
Sdot = zeros(3, 3); %differential matrix of S
Ig = R * inertia * R'; %grobal inertia matrix

pos_ini = [0, 0, 0]';
att_ini = [0, 0, 0]';

%controller params
K = eye(6)*25;
Sig = eye(6);

%controller input
pos_d = [1
         1
         1];
att_d = [pi/12
         pi/4
         pi/6];

%spacial mass matrix
M = zeros(6, 6);
M(1:3, 1:3) = mass * eye(3);
M(4:6, 4:6) = S' * Ig * S;

%centrifugal coriolis matrix
C = zeros(6, 6);
C(4:6, 4:6) = S' * Ig * Sdot + S' * Oskew * Ig * S;
