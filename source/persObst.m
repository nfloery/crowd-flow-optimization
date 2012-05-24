% write each person as obstacle into potential by coordinates
% person = obstacle = 0
% INPUT:
% matrix M2, potential P2, number pers
% OUTPUT:
% potential P2

function [P2] = persObst(M2,P2,pers)

for p=1:pers
    
    x = M2(1,1,p);
    y = M2(2,1,p);   
    
    P2(x,y) = 0;
    
end


end

