X2 = zeros([1,200])
x1 = linspace(1.5,2.5,200)
for i = 1:200
    X2(i) = findx2(x1(i));
end