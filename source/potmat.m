function [A] = potmat(m,n,o,q)

%OUTPUT: 
% (mxn+2) Matrix
%INPUT:
% o = 1: rechteckig, o=2: konisch
% q = breite Ausgang


A = zeros(m,n);

if o == 1  

        for r=1:q
            A(ceil(m/2-q/2)+r,n-5) = 2*n;
        
            for j=1:n
                A(ceil(m/2-q/2)+r,j)= 2*n - (n-j);
            end
        end 

        
    
    
        for i=1:ceil(m/2-q/2)
            for j=1:n
                A(i,j) = 2*n - ((i-ceil(m/2-q/2))^2+(j-n)^2)^(1/2.);
            end
        end
        for i=ceil(m/2+q/2):m
            for j=1:n
                A(i,j) = 2*n - ((i-(m/2+q/2))^2+(j-n)^2)^(1/2.);
            end
        end
        
    A(:,1) = 0;
    A(:,n) = 0;
    A(1,:) = 0;
    A(m,:) = 0;
    for r=1:q
        A(ceil(m/2-q/2)+r,n) = 2*n;
    end    
end

if o == 2
        for r=1:q
            A(ceil(m/2-q/2)+r,n-5) = 2*n;
        
            for j=1:n
            A(ceil(m/2-q/2)+r,j)= 2*n - (n-j);
            end
        end 

        
    
    
        for i=1:ceil(m/2-q/2)
            for j=1:n
                A(i,j) = 2*n - ((i-ceil(m/2-q/2))^2+(j-n)^2)^(1/2.);
            end
        end
        for i=ceil(m/2+q/2):m
            for j=1:n
                A(i,j) = 2*n - ((i-(m/2+q/2))^2+(j-n)^2)^(1/2.);
            end
        end
        
    A(:,1) = 0;
    A(:,n) = 0;
    A(1,:) = 0;
    A(m,:) = 0;

    for a=1:(n-1)
        for b=1:m
            if b<=a*(ceil(m/2-q/2)/n)
                A(b,a) = 0;
            end
        end
    end
    for a=1:(n-1)
        for b=1:m
            if b>=-a*(ceil(m/2-q/2)/n)+m+1
                A(b,a) = 0;
            end
        end  
    end
    for r=1:q
        A(ceil(m/2-q/2)+r,n) = 2*n;
    end 
    
    
end

A = [A,zeros(m,2)]
