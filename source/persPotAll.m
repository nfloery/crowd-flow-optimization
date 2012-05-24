% get the potential values for every person by coordinates
% INPUT: 
% matrix M2, potential P2, number pers
% OUTPUT:
% matrix M2

function [M2] = persPotAll(M2,P2,pers)

for p=1:pers
    
    x = M2(1,1,p);
    y = M2(2,1,p);

    for i=-1:1
        for j=-1:1
            M2(i+2,j+3,p)=P2(x+i,y+j);
        end
    end
end


end

