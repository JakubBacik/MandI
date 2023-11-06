clc;
close all;
clear all;

R = 20;

tab_N = [100,150, 200, 250, 300, 400, 500, 600, 700, 1000, 1200, 1400, 1600, 1800, 2000, 2500, 3000, 3500, 4000, 4500, 5000];
MSE = zeros(length(tab_N), 0);

for i = 1:length(tab_N)
    N = tab_N(i);
    theta_star =10;
    tmp = 0;
    
    for r = 1 : R
        theta = 0;
        for n = 1 : N
            theta = theta + theta_star+ rand()-0.5;
        end
        theta_dash = (1/N)*theta;
        tmp = tmp + (theta_dash- theta_star)^2; 
    end
    MSE(i) = (1/R)*tmp;
end

h = zeros(length(tab_N), 0);

for p = 1:length(tab_N)
    h(p) = (1/12)/tab_N(p);
end
hold on
grid on
plot(tab_N, MSE, 'xb')
plot(tab_N, h,'or')
ylabel("MSE")
xlabel("N")
legend("simulation", "empirical")