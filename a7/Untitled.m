D = [ 0 1 -1 2 -2 3; 0 2 -1 3 1 1]
mu = [-1 2;3 0]
%calculate the distance
dis1 = zeros([2,6])
for i = 1:6
    for j = 1:2
        k = abs(D(:,i)-mu(:,j));
        dis1(j,i) = sqrt(k'*k);
    end
end
%update mu
mu11 = (1/2)*(D(:,2)+D(:,5))
mu12 = (1/4)*(D(:,1)+D(:,3)+D(:,4)+D(:,6))
mu1 = [mu11 mu12]
dis2 = zeros([2,6]);
for i = 1:6
    for j = 1:2
        k = abs(D(:,i)-mu1(:,j));
        dis2(j,i) = sqrt(k'*k);
    end
end
dis2
%update mu
mu11 = (1/2)*(D(:,3)+D(:,5))
mu12 = (1/4)*(D(:,1)+D(:,2)+D(:,4)+D(:,6))
mu2 = [mu11 mu12]
dis3 = zeros([2,6]);
for i = 1:6
    for j = 1:2
        k = abs(D(:,i)-mu2(:,j));
        dis3(j,i) = sqrt(k'*k);
    end
end
dis3
%split into 2 classes
C1D = [D(:,1) D(:,3) D(:,5)]
C2D = [D(:,2) D(:,4) D(:,6)]
musC1 = [mu(:,1) mu1(:,1) mu2(:,1)]
musC2 = [mu(:,2) mu1(:,2) mu2(:,2)]
hold on 
grid on
axis([-3 4 -2 4])
scatter(C1D(1,:),C1D(2,:),'*b')
scatter(C2D(1,:),C2D(2,:),'*r')
scatter(musC1(1,:),musC1(2,:),'*black')
plot(musC1(1,:),musC1(2,:),'-black')
scatter(musC2(1,:),musC2(2,:),'*black')
plot(musC2(1,:),musC2(2,:),'-black')