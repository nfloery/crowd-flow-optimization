function v = movev3(A,n,chaos,velo)

B = A(:,2:4);   %just potential values


v = A(1:3)';    %coordinates

%desired velocity als wertung vor und rück wertung
%B(1,1) = B(1,1)*

%kann nicht rückwärts gehen
%if (v(2)< 2*n/3)
 %   B(1,1) = 0;    
 %   B(2,1) = 0;
  %  B(3,1) = 0;
%end

%desired velocity: 3 grösste werte werden mit velo multipliziert, 3
%kleinste durch 3 dividiert
%bkoord = biggest(B);
%kkoord = smallest(B):

%vorher = v
% x(3) ist null(aktiviert) oder eins(deaktiviert)
if (v(3) == 1)
    v = v;
    
else
    if (v(2)==n) %steht in öffnung, wird eingemauert und deaktiviert
        v(3) = 1;
        v(1) = 2;
        v(2) = n;
    else
    
        %"entscheidungsmatrix" austellen
        B = decision(B,chaos,v(2),n);

        %werte normieren


        %desired speed




        %entscheiden
        x=0;
        y=0;
        xv = zeros(8);
        xv = xv(1:8)';
        yv = xv;
        ref =0.;
        count=0;   %wieviel mit gleichem wert
        %grössten wert suchen
        for i=1:3
            for j=1:3
                if (B(i,j)>= ref)
                    a = B(i,j);
                    if(a==ref)
                        count = count +1;
                        xv(count)=i;
                        yv(count)=j;
                    else
                        ref = B(i,j);
                        count = 1;
                        xv(1)=i;
                        yv(1)=j;
                        x = i;
                        y = j;
                    end
                end
            end
        end

        %x,y are coordinates in B, where the biggest value is
        % count>1 means that the biggest value is in more than one places
        if (count > 1)  %more than one places
            %wenn ref null ist an mehr als einem platz, stehen bleiben
            if (ref ==0)
                x = 2;
                y = 2;
            else
                a = rand(count);
                a = a(1:count)';
                b=max(a);               %let chance choose
                for i=1:count
                    if (a(i)==b)
                        x = xv(i);
                        y = yv(i);
                    end
                end
            end
        end

        %absolute koordinaten ausgeben
        if (x == 1)
            v(1) = v(1)-1;
        end
        if (x == 3)
            v(1) = v(1)+1;
        end
        if (y == 1)
            v(2) = v(2) -1;
        end
        if (y== 3)
            v(2) = v(2) +1; 
        end
    end
    
end
    
end

