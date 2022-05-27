%% P1
clc; clear; close all
s_dir = './hw2_signals/FSJK1_con_160000_mul5.wav'
[s, fs] = audioread(s_dir);
u_dir = './hw2_signals/laplacian1.wav'  
[u, ~] = audioread(u_dir);
f = [-0.4;-1.7;0.1;0.3;-1.1; 1.2; 0.0; 0.3; 0.2];
% d = s + f*u;
d = s + filter(f,1,u);

reg_param = 1e+2;
lambda = 0.9;
RLS('1', d, u, s, f, reg_param, lambda);


%% P2
s_dir = './hw2_signals/FSJK1_con_160000_mul5.wav'
[s, fs] = audioread(s_dir);
u_dir = './hw2_signals/MDAC0_con_160000_mul5.wav'
[u, ~] = audioread(u_dir);
f = [-0.4;-1.7;0.1;0.3;-1.1; 1.2; 0.0; 0.3; 0.2];
% d = s + f*u;
d = s + filter(f,1,u);

reg_param = 1e+2;
lambda = 0.9;
RLS('2', d, u, s, f, reg_param, lambda);



