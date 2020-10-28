% To implement moment-accelerated gradient descent algorithm.
% Input:
% fname: file name of the cost function.
% gname: file name of the gradient of the cost function.
% bt: parameter \beta.
% x0: initial point.
% epsi: tolerance for 2-norm of the gradient. 
% Output:
% xs: solution point.
% fs: cost function at solution point.
% k: number of iterations consumed.
% Written by W.-S. Lu, University of Victoria.
% Last modified: June 10, 2020.
% Example: [xs,fs,k] = gd_moment('f_rosen','g_rosen',0.3,[-1;-1],1e-6);
function [xs,fs,k] = gd_moment(fname,gname,bt,x0,epsi)
k = 0;
xk = x0;
gk = feval(gname,xk);
dk = -gk;
er = norm(gk);
while er >= epsi
  ak = bt_lsearch2019(xk,dk,fname,gname);
  adk = ak*dk;
  xk = xk + adk;
  gk = feval(gname,xk);
  er = norm(gk)
  dk = bt*dk - (1-bt)*gk;
  k = k + 1;
end
disp('solution:')
xs = xk
disp('objective function at solution point:')
fs = feval(fname,xs)
format short
disp('number of iterations performed:')
k