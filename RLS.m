function RLS(Pnum,d,u,s,f,reg_param,lambda)
% Input
%   Pnum : Problem number of Homework
%   d : primary input
%   s : source signal
%   u : refrence input
%   f : filter coefficient
% Output
%   e : error
%   w : adaptive filter coefficient

f_len = length(f);
s_len = length(d);

P = eye(f_len)./ reg_param; % Inverse correlation matrix
w = zeros(f_len,1);
e = zeros(s_len,1);
lambda= 0.9;
for l = f_len : s_len
    u_block = u(l:-1:l-f_len+1);
    k = P*u_block ./ (lambda+ u_block'*P*u_block);
    prior_e = d(l) - w'*u_block; % prior estimation error
    w = w + k.* conj(prior_e);
    P = (1/lambda).* (P - k*u_block'*P);
    e(l) = d(l) - w'*u_block;
end

end
