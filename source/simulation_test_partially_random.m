%{
PARTIALLY RANDOM
skript where the simulation is taking place
%}

zaehler = 1;
it = 10;                     %number of simulations

iterationen = zeros(1,it);
fluss = zeros(1,it);
dichte = zeros(1,it);
dichte50 = zeros(1,it);

for i=1:it
    
% starting parameters  
m = 100;         % size of matrix including walls (up and down)
n = 100;         % size of matrix including exit and walls left
endmove = n;    % for move-function
chaos = 0.2;    % for move-function, chaos parameter
ausgang = 10;   % width of the exit

% creating potential
P = potmat2(m,n,1,ausgang,10);              
%P = obstneu(P,5,8,round(m/2),n-10);       % create one single obstacle
%P = obstneu(P,3,6,round(m/2-3),n-10);      % create two obstacles
%P = obstneu(P,3,6,round(m/2+3),n-10);      % at specific positions

% count occupied cells (obstacle), for density-function
besetzt = countobst(P,m,n,ausgang);         

% determine resulting size
w = size(P);    
m = w(1);
n = w(2);

% copy of potential, that will be used. people walk on P2.
P2 = P;         

% making pictures
Bilder = zeros(m,n,[]);     

%density or absolute value
pers=pdens(0.2,m-2,n-4);    

%number of active people
new_pers=pers;  
old_pers=pers;

%create 3x4xPers-Matrix
M2 = createMat(pers);

%initalize random coord. to matrix
M2 = init(M2,P,pers,m,n);

%person = obstacle
P2 = persObst(M2,P2,pers);

%assign potential to each (!) person by (x,y)
M2 = persPotAll(M2,P2,pers);


% initialize vectors to measure flux & density
pass = [];
density = [];
q = 1;          %iteration counter

while 1         %do, till last person reaches the exit
    
    old_act = new_pers;         % compute efficiency
    
    perm = randperm(new_pers);  % partially random iteration
    
    deleted = [];               % deleted people
    i = 1;                      % deleted counter    
    
    for p = perm

        alt = M2(:,1,p);        % old coordinates
        
        M2 = persPot(M2,P2,p);  % assign potentials
        M2(:,:,p);
        
        v=movev3(M2(:,:,p),n-2,chaos,1);      % MOVE & new coordinates
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
            deleted(i) = p;
            i = i+1;
            
        end
        

    end
    
    
    %delete old matrix elements
    M2(:,:,deleted) = [];                   % delete person  
    new_pers = new_pers-numel(deleted);     % one person less
    Bilder(:,:,q) = P2;                     % make picture
    
    %density
    [a,b] = dens(P2,m,n,ausgang);
    densit = (b-besetzt)/(a-besetzt);
    density(q) = densit;
        
    %efficiency by computing difference of people
    new_act = new_pers;
    pass(q) = old_act-new_act;
    
    
    if new_pers==0  %breaking the while-loop, when all people at exit
        break
    else
        q = q+1;    %iteration counter
    end
    
end

step = linspace(1,q,q);         % number of iterations for plot
mittel = mean(pass);            % mean value of flux

%density = density*ausgang;     % scale density, only for plot

%{
% plotting
figure();
hold on
bar(step,pass, 'black')%,'EdgeColor',[0.75 0.75 0.75])
plot(step,ones(1,q)*mittel, '-r')
title('Measurement of the flux')
legend('Number of people','Mean value')
axis([0 q+1 0 ausgang])
xlabel('Iteration')
ylabel('People leaving')
hold off

%density = density*ausgang;     % scale density, only for plot
figure();
hold on
plot(step,density, '-b');
plot(step,ones(1,q)*mean(density), '-r')
axis([0 q 0 1])
title('Measurement of the density')
legend('Density of people','Mean value')
xlabel('Iteration')
ylabel('Density')
hold off
%}

% save data of current iteration
iterationen(zaehler)=q;
fluss(zaehler)=mean(pass);
dichte(zaehler)=mean(density);
dichte50(zaehler)=mean(density(50:250));

zaehler = zaehler + 1;

end

% show data after iteration
disp('Werte der Iterationen:')
iterationen
fluss
dichte
dichte50
disp('Mittelwert und Standardabweichung: Iterationen')
mean(iterationen)
std(iterationen)
disp('Mittelwert und Standardabweichung: Fluss')
mean(fluss)
std(fluss)
disp('Mittelwert und Standardabweichungen: Dichte')
mean(dichte)
std(dichte)
disp('Mittelwerte und Standardabweichungen: Dichte_50_250')
mean(dichte50)
std(dichte50)



