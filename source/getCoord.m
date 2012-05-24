function [c1,c2,act,inact] = getCoord(M2)
% get information out of matrix M2 
%
% saves the number of active people into c1
% inactive people into c2
% coordinates of active people to act
% coordinates of inactive people to inact
% save values by "[c1,c2,v1,v2] = getCoord(M2);"

v = size(M2);
pers = v(3);

c1 = 0;
c2 = 0;

for i=1:pers
    if M2(3,1,i)==0
        c1 = c1 + 1;
    end
    if M2(3,1,i)==1
        c2 = c2 + 1;
    end   
end

act = zeros(2,c1);
inact = zeros(2,c2);
count1 = c1;
count2 = c2;

    for i=1:pers
        if M2(3,1,i)==0
            act(1,c1-(count1-1)) = M2(1,1,i);
            act(2,c1-(count1-1)) = M2(2,1,i);
            count1 = count1 - 1;
        end
        
        if M2(3,1,i)==1
            inact(1,c2-(count2-1)) = M2(1,1,i);
            inact(2,c2-(count2-1)) = M2(2,1,i);
            count2 = count2 - 1;
        end         

    end

end

