function f = f_wdbc(w,D,mu)
X = D(1:30,:);
y = D(31,:);
P = length(y);
f = 0;
for i = 1:P
    xi = [X(:,i); 1];
    ei = log(1+exp(-y(i)*(w'*xi)))/P;
    f = f + ei;
end
    f = f + 0.5*mu*w'*w;
end

