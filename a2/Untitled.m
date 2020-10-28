clear
% Solving Systems of Algebraic Equations Symbolically
syms x y
[x y] = solve(16*x^3+16*x*y^2-16.7*x+2*y ==0,16*y^3+16*y*x^2-16.7*y+2*x ==0)
x = x(5);
y = y(5);
eqn1 = 48*x^2+16*y^2-16.7;
eqn23 = 32*y*x+2;
eqn4 = 48*y^2+16*x^2-16.7;
eqn = [eqn1 eqn23;eqn23 eqn4]
eqn = double(eqn)
eig(eqn)
