clear 
load X_iris
X1 = X_iris(:,1:50);
Xtr1 = X1(:,1:35);
Xte1 = X1(:,36:50);
X2 = X_iris(:,51:100);
Xtr2 = X2(:,1:35);
Xte2 = X2(:,36:50);
X3 = X_iris(:,101:150);
Xtr3 = X3(:,1:35);
Xte3 = X3(:,36:50);
K = 3

% 1 vs 2 and 3 classes
Ptr = Xtr1;
Ntr = [Xtr2 Xtr3];
Xtr = [ Ptr Ntr];
y = [ ones(35,1); -ones(70,1)];
% weight and confusion matrix
[ws1,CS1] = LRBC_gr(Xtr,y,1e-6)