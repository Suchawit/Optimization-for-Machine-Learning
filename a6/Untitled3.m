X = [-1,0,2,0,1,2; -1,1,0,-2,0,-1];
figure(1)
set(gca,'fontsize',14,'fontname','times')
plot(X(1,1:3),X(2,1:3),'r+','linew',1.5)
hold on
plot(X(1,4:6),X(2,4:6),'bo','linew',1.5) 