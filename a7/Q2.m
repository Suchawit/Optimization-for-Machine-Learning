X = [-2.1 -2 -1.1 -1 -0.9 -0.2 0.1 0 0.1 0.9 1 1.1 1.9 2 2.1 3; 0 1 0 1 2 0 1 2 3 1 2 3 2 3 4 4];
%calcualte mean centerd
m_x1 = sum(X(1,:))/16;
m_x2 = sum(X(2,:))/16;
newX1 = X(1,:)-m_x1;
newX2 = X(2,:)-m_x2;
X = [newX1; newX2]
covx = (1/16)*X*X';
[U,S] = eigs(covx)
hold on
scatter(X(1,:),X(2,:))
plot(U(1,:),'<-r')
V = U(1,:)*X