clc;
clear all;

S_ = 40;
N  = 5000;

X_step = 0.02
function_x = zeros(1,(2/X_step)+1)

idx = 1;
for X = -1:X_step:1
    for i = 1 : S_
        a=0;
        for n = 1 : N
            a = a + calcfi(i ,2 * rand() -1);
        end
        a_dash = 1/N * (a);
        function_x(idx) = function_x(idx) + (a_dash * calcfi(i, X));
    end
    idx = idx + 1;
end
X = -1:X_step:1
hold on
grid on
check = zeros(1,length(X))
check(:) = 0.5
plot(X, check, '--blue')
plot(X, function_x, 'red')
legend('uniform distribution', 'estimate')

ylim([0,1]);


function y=calcfi(i,x)
    if i == 1
        y = 1/sqrt(2);
    
    elseif mod(i,2)
        y = cos( ((i-1)/2) * pi * x );
    
    else
        y = sin( (i/2) * pi * x );
    end
end
