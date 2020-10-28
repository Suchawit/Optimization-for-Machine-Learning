
clear
syms x2  x1

fun = (x2*x1-x1+1.5)^2+(x1*x2^2-x1+2.25)^2+(x1*x2^3-x1+2.625)^2

g1 = diff(fun,x1)

g2 = diff(fun,x2)
g = @(x1)[g1; g2]
h = [diff(g1,x1) diff(g1,x2);diff(g2,x1) diff(g2,x2)]
feval(g,2)
%[xs,fs,k] = grad_desc(fun,g,[2 3],1e-6)
