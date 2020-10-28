H = [ 0.45-0.14j 0.2+0.03j; 0.4+0.11j 0.1-0.13j; 0.15+0.17j 0.3-0.24j]
[U,S,V] = svd(H);
%the channel gains decomposition
SS = S.^2
% V is V
V
log2(2)