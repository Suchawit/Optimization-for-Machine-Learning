load('D_mpg')
M = size(D_mpg,2);
P = 314;
T = M-P;
y = D_mpg(7,:)';
X = D_mpg(1:6,:);
Xh = [X; ones(1,M)];
Xtr = Xh(:,1:P);
Xte = Xh(:,P+1:M);
ytr = y(1:P);
yte = y(P+1:M);
ws = inv(Xtr*transpose(Xtr))*Xtr*ytr
y1 = Xtr'*ws;
y2 = Xte'*ws;
e_tr = sqrt((norm(y1-ytr)^2)/P)
e_te = sqrt((norm(y2-yte)^2)/T)

set(gca,'fontsize',14)
ind = 1:1:P;
plot(ind, ytr,'b-', ind, y1,'r-', 'linew', 1.5)
grid
axis([0 78 0 50])
xlabel('car index')
ylabel('miles per gallon')