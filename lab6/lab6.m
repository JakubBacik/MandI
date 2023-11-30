clc;
clear all;
close all;

NumberOfSampleOnPlot = 20;
N = 1000;
h = 0.4;

x_of_plot = linspace(-1, 1, NumberOfSampleOnPlot);
u_k = 2 * rand(1,N) - 1;
noise = 0.02*rand(1,N)-0.01;

x_end = []
for i = 1 : NumberOfSampleOnPlot
    x_end(i) = x_of_plot(i)^2;
end

y_k(i) = 0;
v_k(i)=0;
for k = 1:N
    if k == 1
        v_k(k) = 1;
    else
        v_k(k) = (1/2*v_k(k-1)) + u_k(k)^2;
    end
end

for k = 1:N
    y_k(k) = v_k(k)+noise(k);
end

x_final(i) = 0;
for i = 1:NumberOfSampleOnPlot
    num = 0;
    denum = 0;
    for k = 1:N
        num = num + y_k(k) * kernel(u_k(k), x_of_plot(i), h);
        denum = denum + kernel(u_k(k), x_of_plot(i), h);
    end
    x_final(i) = num/denum;
end

hold on
grid on
check = zeros(1,NumberOfSampleOnPlot)
check(:) = 0.333 
plot(x_of_plot, x_final)
plot(x_of_plot, x_end)
plot(x_of_plot, check, '--green')
legend('estimate','base', '0.333')

function y = kernel(u_k, u, h)
    x_value = ((u_k-u)/h);

    if x_value <= 0.5 && x_value >= -0.5
        y = 1;
    else
        y = 0;
    end
end