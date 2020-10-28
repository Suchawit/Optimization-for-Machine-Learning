clear
% Q1.12
x = [ -2.1 -2 -1.1 -1 -0.9 -0.2 -0.1 0 0.1 0.9 1 1.1 1.9 2 2.1 3];
x2 = [ 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
xx= [x;x2];
y = [1 2 1 2 3 1 2 3 4 2 3 4 3 4 5 5 ];
ws = inv(xx*transpose(xx))*xx*y'
% ws = 1.7197
hold on
scatter(x,y)
f = @(x) ws(1)*x+ws(2);
ezplot( f, x )
hold off
% predict output when x = 1.5
yout = ws*1.5
% y = 2.5795