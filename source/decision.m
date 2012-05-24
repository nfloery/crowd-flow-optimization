function A = decision(B,chaos,y,n)

%B normieren
A = normMat(B);

%v gibt grad an panik/desired velocity?? an
%v zwischen 0-1

r = rand(9);      
r = r(:,1)*chaos*(1-(y/(n-2)));        %r(i) im intervall [0,v]

%optional zufällig +/- rechnen?!
k=0;
for i=1:3
    for j=1:3
        k = k +1;
        sign = rand;
        if (sign < 0.5)
            sign = -1;
        end
        if (sign > 0.5)
            sign = 1;
        end
        if (sign == 0.5)
            sign = 0;
        end
        A(i,j) = A(i,j)*(1+sign*r(k));
    end
end

A = normMat(A);

            






end

