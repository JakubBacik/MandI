clc;
close all;
clear all;


i=1;
xk = [];

while i < 100000
    x=-log(rand());
    if rand() < 0.5
        x=-x;
    end

    if (abs(x)-1)^2 <= (-2*log(rand()))
         xk(i)=x;
         i= i +1;
    end

end

histogram(xk)
title('Number of samples n = 100000')
ylabel('Frequency')
xlabel('Class intervals')



