function A = normMat(B)

%B ist pot matrix um person
%A soll überarbeitete matrix ausgeben (velocity)

%B normieren
ab = 0;
for i=1:3
    for j=1:3
        ab = ab + B(i,j);
    end
end

for i=1:3
    for j=1:3
        B(i,j) = B(i,j)/ab;
    end
end
A=B;

end

