function [B] = obst(A,sm,sn,m,n)

%OUTPUT:
% Matrix A including obstacle
%INPUT:
% A input matrix
% sm width of obstacle
% sn length of obstacle
% m m-position of obstacle
% n n-position of obstacle

B = A;

for j=0:floor(sm/2.)

for i=1+j:sn-j
    B(m+j,n+i) = 0;
    B(m-j,n+i) = 0;
end

end


