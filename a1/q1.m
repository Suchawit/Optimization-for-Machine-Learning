clear
V = [ 1 1 2 2;1 2 3 2]
C = V*transpose(V)
C2 = transpose(V)*V
eig(C)
eig(C2)
