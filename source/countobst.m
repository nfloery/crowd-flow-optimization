function [counto] = countobst(A,m,n,q)

%INPUT:
% A input matrix
% m m-position of obstacle
% n n-position of obstacle

%OUTPUT:
% counts occupied space in an area qx3q around the exit of matrix A

 counto = sum(A(ceil(m/2-q/2-q):ceil(m/2-q/2-q)+3*q,(n-q):(n-1)) == 0);
 counto = sum(counto);

end

