function [M2] = init(M2,P,pers,m,n)
% INPUT:
% potential P, matrix M2, number pers, size mxn
% OUTPUT:
% assigns random coordinates to each person
% matrix M2 with people having starting positions

for p=1:pers

    while 1
        
        while 1 %obstacle at position (x,y)?
            
            x = round(2+(m-3)*rand); %random values
            y = round(2+(n-5)*rand); 
            
            if P(x,y) ~= 0
                break
            end
                
        end
        
        ok = 0; %counter
        
        for i=1:(p-1)   %look if random x-y-coordinates are taken by previous persons
            if (M2(1,1,i) ~= x || M2(2,1,i) ~= y)
                ok = ok+1;
            end
        end
        
        if ok==p-1
            break
        end
        
    end

    M2(1,1,p) = x;    %assign random coordinates
    M2(2,1,p) = y;
    
end

end

