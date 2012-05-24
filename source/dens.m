function [ges, full] = dens(A,m,n,q)
%OUPUT:
% Ausgabe der dichte an Personen beim Ausgang

%INPUT:
% A Input matrix
% nxm Martix
% q Breite Ausgang
% Ausgabe: ges = Anzahl besetzter Plätze, full = Plätze im 
% Bereich qx3p beim Ausgang.

 full = [];
 ges = [];
        
              
 full = sum(A(ceil(m/2-q/2):ceil(m/2-q/2)+q,(n-q):(n-1)) == 0);
 full = sum(full);
         
 siz = size(A(ceil(m/2-q/2):ceil(m/2-q/2)+q,(n-q):(n-1)));
           
 ges = siz(1)*siz(2);
