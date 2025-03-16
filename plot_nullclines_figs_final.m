%This code plots the nullcline figures for Figure 3 of "On integrating
%artificial intelligence into pest management", by Godsoe et al. 2025.
%
% Rats are on the x-axis, Weka are on y-axis.

% Parameters are as in the paper.


params.r_W=1.3; %r_W
params.r_R=4; %r_R
params.a_WR=0.05; %a_WR
params.a_RW=0.1;  %a_RW
params.a_WW=1.9; %a_WW
params.a_RR=0.25; %a_RR
params.h=0.03;      %h
params.a=300;       %a


for kk=1:3

    figure()
    hold on

    switch kk
        case 1

            %-------------------------------------------------------------
            %  region A (coexistence)
            %-------------------------------------------------------------
            params.gamma_W=0.05;
            params.gamma_R=0.3;


        case 2
            %-------------------------------------------------------------
            %  region A ( not quite extinction)
            %-------------------------------------------------------------
            params.gamma_W=0.05;
            params.gamma_R=0.49;


        case 3
            %-------------------------------------------------------------
            %  region C (extinction)
            %-------------------------------------------------------------
            params.gamma_W=0.05;
            params.gamma_R=0.52;

    end

    %-------------------------------------------------------------
    %plot nullclines

    %x-nullcline
    fimplicit(@(v,u) params.r_W-params.a_WR*v-params.a_WW*u-params.gamma_W.*params.a./(1+(u+v)*params.a*params.h),[0 20 0 2],'Color',[0.6350 0.0780 0.1840],'Linewidth', 2) %red
    hold on

    %y nullcline
    fimplicit(@(v,u) params.r_R-params.a_RW*u-params.a_RR*v-params.gamma_R.*params.a./(1+(u+v)*params.a*params.h),[0 20 0 2],'Color',[0 0.4470 0.7410],'Linewidth', 2) %blue


    plot([0 20],[0 0],'Linewidth', 2,'Color',[0.6350 0.0780 0.1840]) %red)

    plot([0 0],[0 2],'Linewidth', 2,'Color',[0 0.4470 0.7410]) %blue

    box on

    set(gcf, 'Position', [100, 100, 400, 250]);  % Width = 800, Height = 400
    set(gca,'FontSize',20)

    %-------------------------------------------------------------

    %plot equilibria (coordinates determined by hand)
    markersizestable=48;
    markersizeunstable=13;


    plot(0,0,'k.','MarkerSize',markersizestable)

    switch kk
        case 1
            plot(12.87,0.28,'k.','MarkerSize',markersizestable);
            plot(12.933,0,'ko','MarkerSize',markersizeunstable,'MarkerFaceColor',[1,1,1],'MarkerEdgeColor',[0,0,0],'LineWidth',2);
            plot(2.572,0.325,'ko','MarkerSize',markersizeunstable,'MarkerFaceColor',[1,1,1],'MarkerEdgeColor',[0,0,0],'LineWidth',2);
            plot(2.95,0,'ko','MarkerSize',markersizeunstable,'MarkerFaceColor',[1,1,1],'MarkerEdgeColor',[0,0,0],'LineWidth',2);


        case 2

            plot(8.834,0.3575,'k.','MarkerSize',markersizestable);
            plot(6.47,0.388,'ko','MarkerSize',markersizeunstable,'MarkerFaceColor',[1,1,1],'MarkerEdgeColor',[0,0,0],'LineWidth',2);


    end

    % Uncomment the following two lines if you want to save the figures
    %filename=[sprintf('phaseportraitfig%1.0f',kk),'.pdf'];
    %exportgraphics(gcf, filename,'ContentType', 'vector');


    %-------------------------------------------------------------

end













