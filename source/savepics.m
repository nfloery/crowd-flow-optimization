function save = savepics(A)
v = size(A);
m = v(1);
n = v(2);
q = v(3);
for i=1:q
    for k=1:m
        for l=1:n
            if A(k,l,i)== 0
                A(k,l,i) = 1;
            else
                A(k,l,i) = 0.5;
            end
        end
    end          
    filename = sprintf('pic_%d.bmp',i);
    imwrite(A(:,:,i),filename,'bmp')
end
print 'done'

end

