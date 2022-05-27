% Adaptive Filter Homework
% 2021/10/13
% s : signal source
% u : noise source
% d : primary input, d = s + f* u  
% Function : 1. 2. 3. 4

%% Problem 1
clc; close all; clear
s_name = 'FSJK1_con_160000_mul5.wav';
[s,fs] = audioread(s_name);
u_name = 'laplacian1.wav';
[u, ] = audioread(u_name);
f = [-0.4, -1.7, 0.1, 0.3, -1.1, 1.2, 1.2, 0.0, 0.3, 0.2];
% d = s + f*u , primary input
d = s + filter(f,1,u);
LMS('1',d, u, s, f);

%% Problem 2
clc; clear; close all
s_name = 'FSJK1_con_160000_mul5.wav';
[s,fs] = audioread(s_name);
u_name =  'MDAC0_con_160000_mul5.wav';
[u, ] = audioread(u_name);
f = [-0.4, -1.7, 0.1, 0.3, -1.1, 1.2, 1.2, 0.0, 0.3, 0.2];
% d = s + f*u , primary input
d = s + filter(f,1,u);
LMS('2',d, u, s, f);


%% Problem 3-1
clc; clear; close all;
s_name = 'FSJK1_con_160000_mul5.wav';
[s,fs] = audioread(s_name);
u_name = 'laplacian1.wav';
[u, ] = audioread(u_name);
f_name = 'standp4m1_nhpf_512.wav';
[f, ] = audioread(f_name);
f = f.';
d = s + filter(f,1,u);
LMS('3-1',d, u, s, f);


%% Problem 3-2
clc; clear; close all;
s_name = 'FSJK1_con_160000_mul5.wav';
[s,fs] = audioread(s_name);
u_name = 'MDAC0_con_160000_mul5.wav';
[u, ] = audioread(u_name);
f_name = 'standp4m1_nhpf_512.wav';
[f, ] = audioread(f_name);
f = f.';
d = s + filter(f,1,u);
LMS('3-2',d, u, s, f);

%% Problem 4
clc; clear; close all;
s_name = 'FSJK1_con_160000_mul5.wav';
[s,fs] = audioread(s_name);
u_name = 'MDAC0_con_160000_mul5.wav';
[u, ] = audioread(u_name);

f_name = 'standp4m1_nhpf_512.wav';
[f, ] = audioread(f_name);  
f = f.';
d = s + filter(f,1,u);
NLMS('4',d, u, s, f);

%% Problem 5
clc; clear; close all;
s_name = 'FSJK1_con_160000_mul5.wav';
[s,fs] = audioread(s_name);
u_name = 'MDAC0_con_160000_mul5.wav';
[u, ] = audioread(u_name);
f_name = 'standp4m1_nhpf_512.wav';
[f, ] = audioread(f_name);  
f = f.';
d = s + filter(f,1,u);
FastBlockLMS('5',d, u, s, f);




