% get the potential values for one person p by coordinates
% INPUT: 
% matrix M2, potential P2, person p
% OUTPUT:
% matrix M2

function [M2] = persPot(M2,P2,p)
    
    x = M2(1,1,p);
    y = M2(2,1,p);

    for i=-1:1
        for j=-1:1
            M2(i+2,j+3,p)=P2(x+i,y+j);
        end
    end

end

