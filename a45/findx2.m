function S = findx2(x1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
syms x2
w = [-1.3764 1.5014 1.0892 1.3155 0.0711 -0.1547];

equ =w(1)*x1+w(2)*x2+w(3)*x1^2+w(4)*x1*x2+w(5)*x2^2+w(6) ==0;
S = double(max(solve(equ,x2)));
end

