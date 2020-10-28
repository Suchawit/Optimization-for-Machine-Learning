%part A
load('building256.mat')
X = building256/255;
%part B
C = X*transpose(X);
[Vector, Value] =eigs(C);
% find 5 largest value
Value_largest = max(Value)
% part c
tx=transpose(X);
v1 = 1/(sqrt(Value_largest(1,1)))*tx*Vector(:,1);
v2 = 1/(sqrt(Value_largest(1,2)))*tx*Vector(:,2);
v3 = 1/(sqrt(Value_largest(1,3)))*tx*Vector(:,3);
v4 = 1/(sqrt(Value_largest(1,4)))*tx*Vector(:,4);
v5 = 1/(sqrt(Value_largest(1,5)))*tx*Vector(:,5);
%part d
X1 = sqrt(Value_largest(1,1))*Vector(:,1)*transpose(v1);
X2 = X1 + sqrt(Value_largest(1,2))*Vector(:,2)*transpose(v2);
X3 = X2 + sqrt(Value_largest(1,3))*Vector(:,3)*transpose(v3);
X4 = X3 + sqrt(Value_largest(1,4))*Vector(:,4)*transpose(v4);
X5 = X4 + sqrt(Value_largest(1,5))*Vector(:,5)*transpose(v5);
% part e
averageX = (X1+ X2 + X3+X4+X5)/5;
e1 = norm((X1-averageX),'fro')/norm(averageX,'fro')
e2 = norm((X2-averageX),'fro')/norm(averageX,'fro')
e3 = norm((X3-averageX),'fro')/norm(averageX,'fro')
e4 = norm((X4-averageX),'fro')/norm(averageX,'fro')
e5 = norm((X5-averageX),'fro')/norm(averageX,'fro')
% part f
figure(1)
subplot(221)
imshow(X)
title('original building256')
subplot(222)
imshow(X1)
title('rank-1 approximation')
subplot(223)
imshow(X3)
title('rank-3 approximation')
subplot(224)
imshow(X5)
title('rank-5 approximation') 