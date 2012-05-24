% INPUT
% number of people "pers"
% OUTPUT
% matrix M2 which is 3x4xpers-shaped, M2 contains the information about each person

function [ M2 ] = createMat(pers)

    for i=1:pers    
        M(:,:,i) = zeros(3,3);
    end
    for i=1:pers
        M2(:,:,i) = [M(:,:,i),zeros(3,1)];
    end

end

