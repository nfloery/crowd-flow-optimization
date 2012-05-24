function [A] = potmat2(m,n,o,q,d)

%OUTPUT:
% (mxn+2) Matrix
%INPUT:
% o = 1: rechteckig, o=2: konisch
% q = breite Ausgang
% d = relative zahl für die "schnelle" des abfalls

A = zeros(m,n);

if o == 1  

        for r=1:q
            A(ceil(m/2-q/2)+r,n-5) = exp(-2*n);
        
            for j=1:n
                A(ceil(m/2-q/2)+r,j)= exp(-(n-j)/(n/d));
            end
        end 
   
        for i=1:ceil(m/2-q/2)
            for j=1:n
                A(i,j) = exp(-((i-ceil(m/2-q/2))^2+(j-n)^2)^(1/2.)/(n/d));
            end
        end
        for i=ceil(m/2+q/2):m
            for j=1:n
                A(i,j) = exp(-((i-(m/2+q/2))^2+(j-n)^2)^(1/2.)/(n/d));
            end
        end
        
    A(:,1) = 0;
    A(:,n) = 0;
    A(1,:) = 0;
    A(m,:) = 0;
    for r=1:q
        A(ceil(m/2-q/2)+r,n) = 1;
    end    
end

if o == 2
        for r=1:q
            A(ceil(m/2-q/2)+r,n-5) = exp(-2*n);
        
            for j=1:n
            A(ceil(m/2-q/2)+r,j)= exp(-(n-j)/(n/d));
            end
        end 
   
        for i=1:ceil(m/2-q/2)
            for j=1:n
                A(i,j) = exp(-((i-ceil(m/2-q/2))^2+(j-n)^2)^(1/2.)/(n/d));
            end
        end

        for i=ceil(m/2+q/2):m
            for j=1:n
                A(i,j) = exp(-((i-(m/2+q/2))^2+(j-n)^2)^(1/2.)/(n/d));
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
        A(ceil(m/2-q/2)+r,n) = 1;
    end 
    
    
end

A = [A,zeros(m,2)]
