function [f_adaptive,step_size]= FastBlockLMS(Pnum,d,u,s, f)
% s : source signal
% u : reference input
% f : filter coefficient
L = 512;
N = size(f,2);
%input data length
M = length(u);
Nframes = fix(M/L);
w_temp = zeros(L,1);
W_temp = zeros(2*L,1);
P = 0;
gamma = 0.9;
MSE_buff = zeros(M-size(f,2)+1,4);
fprintf('Iteration:    ');
n = 1;
e_final = inf;
    
for num = 1
    fprintf('\b\b\b\b%4d', num);
    e = zeros(M,1);
    step_size_temp = 0.1 * num;
    for i = 1 : Nframes - 1
        % overlap save method
        if i == 0
            Uvec = fft([zeros(L-1,1); u(1:L)], 2*L);
        else
            % block k-1, k; transformed input signal U(k)
            Uvec = fft((u((i-1)*L+1:(i+1)*L)),2*L);
        end
        % block k, output signal y(k), last M elements
        yvec = ifft(Uvec.*W_temp);
        % save last block
        yvec = yvec(L+1 : 2*L, 1);
        % block k; desried signal
        dvec = d(i*L+1 : (i+1)*L);
        % block k, error signal
        e(i*L+1:(i+1)*L, 1) = dvec-yvec;
        %transformation of estimation error
        % insert zero block
        Evec = fft([zeros(L,1); e(i*L+1:(i+1)*L)], 2*L);
        % estimated power / nonstationary environments (voice signal)
        P = gamma * P + (1-gamma)*abs(Uvec).^2;
        % block k, inverse of power
        Dvec = 1./P ;
        % estimated gradient
        g = ifft(Dvec.*conj(Uvec).*Evec,2*L);
        % Delete last block
        g = g(1:L);
        % Append zero block
        g = fft([g;zeros(L,1)], 2*L);
        % update filter
        W_temp = W_temp + step_size_temp*g;
    end
    w_temp = ifft(W_temp);
    w_temp = real(w_temp(1:length(W_temp)/2));
    e = real(e(:));
    if e_final > sum(abs(e-s).^2,1)
        e_final = sum(abs(e).^2,1);
        error = e;
        step_size = step_size_temp;
        w = w_temp;
    end
end
f_adaptive = w;
% error = d - filter(f_adaptive,1,u);
figure(1)
plot(error); title({['[Probelm',Pnum, ']'];['error signal '' best step size :', num2str(step_size)]})
ylim([-1,1]); xlabel('iteration'); ylabel('amplitude')
figure(2)
plot(error-s); title({['[Probelm',Pnum, ']'];['error signal - source signal '' best step size :', num2str(step_size)]})
ylim([-1,1]); xlabel('iteration'); ylabel('amplitude')
figure(3)
title({['[Probelm',Pnum, ']'];' filter weigth'})
a1= scatter(linspace(1,size(f,2),size(f,2)),f,'*','r'); 
hold on 
a2 =scatter(linspace(1,size(f,2),size(f,2)),f_adaptive,'+', 'b'); 
hold off
legend([a1,a2],{'reference filter ','adaptive filter'});
xlabel('filter length'); ylabel('coefficient')
figure(4)
title({['[Probelm',Pnum, ']'];'step_size wise MSE '})
b1 = plot(MSE_buff(:,1),'r--*'); 
hold on 
b2 = plot(MSE_buff(:,2),'b--o'); 
hold on
b3 = plot(MSE_buff(:,2),'g--+'); 
hold on
b4 = plot(MSE_buff(:,2),'k--d'); 
hold off
legend([b1,b2,b3,b4],{'step_size : 0.01','step_size : 0.1', 'step_size : 1', 'step_size : 10'});
xlabel('iteration'); ylabel('Mean square error')
    