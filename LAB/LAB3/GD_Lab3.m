function xs = GD_Lab3(fname,gname,x0,D, mu, K)
format compact
format long
k = 1;
xk = x0;
gk = feval(gname, xk, D, mu);
dk = -gk;
ak = bt_lsearch2019(xk,dk, fname,gname,D, mu);
adk = ak*dk;
while k <= K
  xk = xk + adk;
  gk = feval(gname,xk, D, mu);
  dk = -gk;
  ak = bt_lsearch2019(xk,dk, fname,gname, D, mu);
  adk = ak*dk;
  k = k + 1;
end
xs = xk + adk;

