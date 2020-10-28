%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
w = [-1.3764 1.5014 1.0892 1.3155 0.0711 -0.1547];
syms x2
equ =w(1)*1+w(2)*x2+w(3)*1^2+w(4)*1*x2+w(5)*x2^2+w(6) ==0
equ
S = double(max(solve(equ,x2)))
