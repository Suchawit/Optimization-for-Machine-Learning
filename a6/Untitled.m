clear
x1 = [ 1.5 3.5 5 6.9 8.4 10 11.2 1 2.1 3.1 4 5.9 7.9 9 10.5];
x2 = [ 7 6.5 5 3.7 3 5 1.3 4.5 3.5 5.5 4.2 2.7 2.2 1.6 0.8];
xx = [x1;x2;1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
y = [1 1 1 1 1 1 1 -1 -1 -1 -1 -1 -1 -1 -1];
x = [x1;x2];
ws = inv(xx*transpose(xx))*xx*y' 
x_bound = linspace(-5,15,200);
yy = -(ws(1)/ws(2))*x_bound-(ws(3)/ws(2));

ws2 = inv(xx*xx'+3.2*15*[1 0 0; 0 1 0; 0 0 0])*xx*y'
yy2 = -(ws2(1)/ws2(2))*x_bound-(ws2(3)/ws2(2));
hold on
%calculate L2 loss
for i=1:15
    e2 = (ws(1)*x1(i)+ws(2)*x2(i)-y(i))^2;
    e2 = e2+e2;
end
disp("ER and ER2 are given as")
e2 = (1/30)*e2
e2r = e2 + 1.6*ws(1:2)'*ws(1:2)

plot(x_bound,yy,'g-')
plot(x_bound,yy2,'b-')
scatter(x1(1:7),x2(1:7),'r+')
scatter(x1(8:15),x2(8:15),'bo')
legend({'Part(b) boundary decision','Part(c) boundary decision'})
hold off
y = sign(ws(1:2)'*x+ws(3))
y = sign(ws2(1:2)'*x+ws2(3))