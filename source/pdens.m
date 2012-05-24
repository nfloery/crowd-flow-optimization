% compute number of people by percentage
% INPUT:
% size mxn and density x
% OUTPUT:
% number of people pers

function [ pers ] = pdens(x,m,n)
% people densitiy in %

    pers=round((m*n)*x);

end

