
u = rand(1,1000000);
z = zeros(1000000, 0);
for i = 1 : 1000000
    if u(i) < 0.5
        z(i)=sqrt(2*u(i))-1;
    end
    if u(i) > 0.5
        z(i)=1-sqrt(-2*u(i)+2);
    end
end

histogram(z,40);
title('Number of samples n = 1000000')
ylabel('Frequency')
xlabel('Class intervals')