clear
syms x

fun = @(x) (x(2)*x(1)-x(1)+1.5)^2+(x(1)*x(2)^2-x1+2.25)^2+(x(1)*x(2)^3-x(1)+2.625)^2

g1 = @(x) 2*(x(2)^2 - 1)*(x(1)*x(2)^2 - x(1) + 9/4) + 2*(x(2)^3 - 1)*(x(1)*x(2)^3 - x(1) + 21/8) + 2*(x(2) - 1)*(x(1)*x(2) - x(1) + 3/2)
g2 = @(x) 2*x(1)*(x(1)*x(2) - x(1) + 3/2) + 4*x(1)*x(2)*(x(1)*x(2)^2 - x(1) + 9/4) + 6*x(1)*x(2)^2*(x(1)*x(2)^3 - x(1) + 21/8)

g = @(x)[g1;g2]
feval(g,[2 3])
[xs,fs,k] = grad_desc(fun,g,[2 3],1e-6)
%feval(g,[2 3])
%g = @(x)[2*(x(2)^2 - 1)*(x(1)*x(2)^2 - x(1) + 9/4) + 2*(x(2)^3 - 1)*(x(1)*x(2)^3 - x(1) + 21/8) + 2*(x(2) - 1)*(x(1)*x(2) - x(1) + 3/2); g2;
%    2*x(1)*(x(1)*x(2) - x(1) + 3/2) + 4*x(1)*x(2)*(x(1)*x(2)^2 - x(1) + 9/4) + 6*x(1)*x(2)^2*(x(1)*x(2)^3 - x(1) + 21/8)];
%h =[diff(g1,x1) diff(g1,x2);diff(g2,x1) diff(g2,x2)]