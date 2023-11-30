clc;
clear all;

K_ = 100;
N  = 10000;
S = 10;


u_k = 2 * rand(1,N) -1;
tab = linspace(-1,1, K_);

end_tab = [];
for i = 1 : length(tab)
    end_tab(i) = star(tab(i));
end

plot(tab, end_tab, '--blue')


x = 2 * rand(1,N) -1;
noise = 0.02*rand(1,N)-0.01;



a_dash = zeros(1,S);
b_dash = zeros(1,S);

for s = 1 : S
    a = 0;
    b = 0;
    for n = 1 : N
        a = a + calcfi(s ,(x(n)));
        b = b + ((star(x(n))+noise(n))*calcfi(s ,x(n)));
    end
  
    a_dash(s) = 1/N * (a);
    b_dash(s) = 1/N * (b);
end

function_a(i) = 0;
function_b(i) = 0;
tab_end(i) = 0; 

for k = 1 : K_
    for i = 1:S
        cal = calcfi(i, tab(k))
        function_a(k) = function_a(k) + (a_dash(i) * calcfi(i, tab(k)));
        function_b(k) = function_b(k) + (b_dash(i) * calcfi(i, tab(k)));
    end
    tab_end(k) = function_b(k)/function_a(k);
end

hold on
grid on
plot(tab, tab_end)
legend('base', 'estimation')

function y=star(u)  
    numberOfStair = 2;
    y= floor(u*numberOfStair)/numberOfStair;
end

function y=calcfi(i,x)
    %y= normalLegendre(i,x)
    if i == 1
        y = 1/sqrt(2);

    elseif mod(i,2)
        y = cos( ((i-1)/2) * pi * x );

    else
        y = sin( (i/2) * pi * x );
    end
end 


