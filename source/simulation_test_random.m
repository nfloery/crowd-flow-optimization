% TOTATLLY RANDOM
% only used to compare with PARTIALLY RANDOM
% in the end PARTIALLY RANDOM chosen

m = 100;        % Matrixgroesse aktiv mit wand oben und unten
n = 100;        % Matrixgroesse aktiv inkl. Ausgang und wand links
endmove = n;    % fuer move-funktion
ausgang = 10;
chaos = 0.2;

P = potmat2(m,n,1,ausgang,5);   % 1 normal, 2 konisch
P = obstneu(P,3,6,m/2,n-13);
%P = obstneu(P,3,6,m/2+8,n-13);

w = size(P);
m = w(1);
n = w(2);   % resultierendes n = n+2

P2 = P;     % copy of potential, that will be used. people walk on P2.

Bilder = zeros(m,n,[]);
mv = 0;
video = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% density or absolute value
pers=pdens(0.15,m-2,n-4);
%pers=4; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

new_pers=pers;  %number of active people
old_pers=pers; 

%create 3x4xPers-Matrix
M2 = createMat(pers);

%initalize random coord. to matrix
M2 = init(M2,P,pers,m,n);

%person = obstacle
P2 = persObst(M2,P2,pers);
Bilder(:,:,video)=P2;

%assign potential to each (!) person by (x,y)
M2 = persPotAll(M2,P2,pers);

pass = [];          %number of people passing exit per interval
i = 1;              %pass-counter
numerator = pers;   %helping numerator
density =[];

q = 1;              %iteraton-counter

while 1             %do, till the last person reaches the exit
    
    p = randi(new_pers,1,1);    %random (!) active person is chosen
    
    alt = M2(:,1,p);            %old coordinates

    %assign potential to current person
    M2 = persPot(M2,P2,p);

    v=movev3(M2(:,:,p),n-2,chaos);      %MOVE !!!
    x=v(1);
    y=v(2);
    z=v(3);

    if z==0     %person moved & is still active

        %person=obstacle, restore original potential-value
        P2(alt(1),alt(2)) = P(alt(1),alt(2));
        P2(x,y) = 0;

        %update: new coordinates to matrix
        M2(1,1,p) = x;
        M2(2,1,p) = y;
        M2(3,1,p) = z;

    else        %person reached exit

        P2(alt(1),alt(2)) = P(alt(1),alt(2));

        M2(:,:,p) = [];         %delete person  
        new_pers = new_pers-1;  %one person less
        

    end
    
    mv = mv+1;
    modulo = round(pers/2);
    
    if mod(mv,modulo)==0
        
        video = video +1;
        Bilder(:,:,video)=P2;
        
    end
    
    if mod(mv,modulo)==0
        
        %density
        density(video-1) = dens(P2,m,n,1,ausgang);
      
        %fluss
        pass(video-1)=old_pers-new_pers;  %get number of people that passed the exit in the interval
        %step(i)=q;
        %i = i+1;
        old_pers=new_pers;
        numerator=numerator+old_pers;
        
    end
    
    if new_pers==0  %breaking the while-loop, when all people at exit
        break
    else
        q = q+1;    %iteration counter
    end 
 
end

Bilder(:,:,video+1)= P2;

%Efficiency plot
step = linspace(1,video-1,video-1); %"Abtastinterval"
mittel = mean(pass);                %mean value

hold on
bar(step,pass);
%plot(step,ones(1,video-1)*mittel, '-r')
%plot(step,ones(1,video-1)*ausgang, '-g')
plot(step,density, '-r');
title('number of people passing the exit per sampling-interval')
%legend('number of people','mean value', 'max = exit width')
hold off
