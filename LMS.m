function [f_adaptive,step_size]= LMS(Pnum,d,u,s, f)
% s : source signal
% u : reference input
% f : filter coefficient

%input data length
M = length(u);
MSE_buff = zeros(M,4);
fprintf('Iteration:    ');
n = 1;
e_final = inf;

for num = 1:3:1001
    fprintf('\b\b\b\b%4d', num);
    e = zeros(size(u,1),1);
    f_adaptive_temp = zeros(1,size(f,2));
    step_size_temp = 0.001 * num;
    for l = size(f,2) : M
        u_block = u(l:-1:l-size(f,2)+1)';
        y = conj(f_adaptive_temp)*u_block.';
        e(l) = d(l) - y;
        % update filter
        % w = w + mu*u*e
        f_adaptive_temp = f_adaptive_temp + step_size_temp * e(l) .* u_block;
    end
    if (step_size_temp == 0.001) || (step_size_temp == 0.01) || (step_size_temp == 0.1) || (step_size_temp == 1)
        MSE_buff(:,n)=  abs(e).^2;
        n = n+1;
    end
    if e_final > sum(abs(e-s).^2,1)
        e_final = sum(abs(e).^2,1);
        error = e;
        f_adaptive = f_adaptive_temp;
        step_size = step_size_temp;
    end
end
error = d - filter(f_adaptive,1,u);
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
legend([b1,b2,b3,b4],{'step_size : 0.001','step_size : 0.01', 'step_size : 0.1', 'step_size : 1'});
xlabel('iteration'); ylabel('Mean square error')
    