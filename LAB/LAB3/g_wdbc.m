function g = g_wdbc(w,D,mu)
X = D(1:30,:);
y = D(31,:);
P = length(y);
g = zeros(31,1);
for i = 1:P
    xi = [X(:,i); 1];
    ei = exp(y(i)*(w'*xi));
    gi = -y(i)*xi/(1+ei);
    g = g + gi;
end
g = g/P + mu*w;
end

