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
[ws1,CS1] = LRBC_newton(Xtr,y,K)
disp('Confusion matrix class 1 vs class  2and3');
Total_number_correct = trace(CS1)
classification_accuracy = Total_number_correct/length(Xtr)

% 2 vs 1 and 3 classes
Ptr = Xtr2;
Ntr = [Xtr1 Xtr3];
Xtr = [ Ptr Ntr];
y = [ ones(35,1); -ones(70,1)];
% weight and confusion matrix
[ws2,CS2] = LRBC_newton(Xtr,y,K)
disp('Confusion matrix class 2 vs class  1and3');
Total_number_correct = trace(CS2)
classification_accuracy = Total_number_correct/length(Xtr)

% 3 vs 1 and 2 classes
Ptr = Xtr3;
Ntr = [Xtr2 Xtr1];
Xtr = [ Ptr Ntr];
y = [ ones(35,1); -ones(70,1)];
% weight and confusion matrix
[ws3,CS3] = LRBC_newton(Xtr,y,K)
disp('Confusion matrix class 3 vs class  1and2');
Total_number_correct = trace(CS3)
classification_accuracy = Total_number_correct/length(Xtr)

% normalize
w1 = ws1(1:4)/norm(ws1(1:4));
b1 = ws1(5)/norm(ws1(1:4));
w2 = ws2(1:4)/norm(ws2(1:4));
b2 = ws2(5)/norm(ws2(1:4));
w3 = ws3(1:4)/norm(ws3(1:4));
b3 = ws3(5)/norm(ws3(1:4));

% train model
Ws = [w1 w2 w3];
bs = [b1 b2 b3];
E = zeros(3,45);
Xte = [ Xte1 Xte2 Xte3];
for i = 1:length(Xte)
    xi = Xte(:,i);
    y = Ws'*xi+bs';
    [~,d] = max(y);
    E(d,i) = 1;
end
disp('Confusion matrix');
E1 = E(:,1:15);
c1=sum(E1')';
E2 = E(:,16:30);
c2=sum(E2')';
E3 = E(:,31:45);
c3=sum(E3')';

C = [c1 c2 c3]

Total_number_correct = trace(C)
classification_accuracy = Total_number_correct/length(Xte)
classification_accuracy = Total_number_correct/sum(C,'all');
