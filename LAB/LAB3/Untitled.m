clear
load D_wdbc
Dtr = D_wdbc(:,1:285);
Dte = D_wdbc(:,286:569);
Xtr = zeros(30,285);
m = zeros(1,30);
v = zeros(1,30);
for i = 1:30
    
    xi = Dtr(i,:);
    m(i) = mean(xi);
    v(i) = sqrt(var(xi));
    Xtr(i,:) = (xi - m(i))/v(i);
end 
Xte = zeros(30,284);
for i = 1:30
 xi = Dte(i,:);
 Xte(i,:) = (xi - m(i))/v(i);
end 
ytr = Dtr(31,:);
yte = Dte(31,:); 
D = [Xtr; ytr];
w0 = zeros(31,1);
w1 = GD_Lab3('f_wdbc','g_wdbc',w0,D,0,10);
w2 = GD_Lab3('f_wdbc','g_wdbc',w0,D,0.1,10);
w3 = GD_Lab3('f_wdbc','g_wdbc',w0,D,0,30);
w4 = GD_Lab3('f_wdbc','g_wdbc',w0,D,0.075,30);

indp = find(yte>0);
indn = find(yte<0);
E = zeros(2,284);
for i=1:length(Xte)
    ti = sign(w1(1:30)'*Xte(:,i) + w1(31));
    ind = -ti/2+1.5;
    E(ind,i) = 1;
end
E1 = E(:,indp);
c1=sum(E1')';
E2 = E(:,indn);
c2=sum(E2')';
C1 = [c1 c2]
Total_number_correct = trace(C1)
classification_accuracy = Total_number_correct/length(Xte)

E = zeros(2,284);
for i=1:length(Xte)
    ti = sign(w2(1:30)'*Xte(:,i) + w2(31));
    ind = -ti/2+1.5;
    E(ind,i) = 1;
end
E1 = E(:,indp);
c1=sum(E1')';
E2 = E(:,indn);
c2=sum(E2')';
C2 = [c1 c2]
Total_number_correct = trace(C2)
classification_accuracy = Total_number_correct/length(Xte)


E = zeros(2,284);
for i=1:length(Xte)
    ti = sign(w3(1:30)'*Xte(:,i) + w3(31));
    ind = -ti/2+1.5;
    E(ind,i) = 1;
end
E1 = E(:,indp);
c1=sum(E1')';
E2 = E(:,indn);
c2=sum(E2')';
C3 = [c1 c2]
Total_number_correct = trace(C3)
classification_accuracy = Total_number_correct/length(Xte)

E = zeros(2,284);
for i=1:length(Xte)
    ti = sign(w4(1:30)'*Xte(:,i) + w4(31));
    ind = -ti/2+1.5;
    E(ind,i) = 1;
end
E1 = E(:,indp);
c1=sum(E1')';
E2 = E(:,indn);
c2=sum(E2')';
C4 = [c1 c2]
Total_number_correct = trace(C4)
classification_accuracy = Total_number_correct/length(Xte)


