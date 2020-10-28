clear
k = 1;
xk = [0;0;0];
gk = feval('ELR',xk)
dk = -gk
ak = bt_lsearch2019(xk,dk,'ELR','GELR')
adk = ak*dk
er = norm(adk)
epsi = 1e-6

while er >= epsi
    xk = xk + adk
    gk = feval('ELR',xk);
    dk = -gk;
    ak = bt_lsearch2019(xk,dk,'ELR','GELR');
    adk = ak*dk;
    er = norm(adk);
    k = k + 1;
end


