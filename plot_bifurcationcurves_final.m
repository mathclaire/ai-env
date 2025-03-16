
%This code plots the bifurcation figure for Figure 3 of "On integrating
%artificial intelligence into pest management", by Godsoe et al. 2025.

%this version plots the only the parts of each curve which divide the
%parameter space into four regions. Corners are figured out manually,
%will not work if parameters change

par.r1=1.3; %r_W
par.a11=1.9; %a_WW
par.a12=0.05; %a_WR

par.r2=4; %r_R
par.a22=0.25; %a_RR
par.a21=0.1; %a_RW

par.a=300; %a
par.h=0.03; %h

figure()
hold on


grey=0.5;

%lines for single species extinction

g1_weka_ext=(par.a11/(4*par.a^2*par.h))*(1+par.a*par.r1*par.h/par.a11)^2;

plot([0.504,1],[g1_weka_ext,g1_weka_ext],'Color',[grey grey grey],'Linewidth',2);

g2_rat_ext=(par.a22/(4*par.a^2*par.h))*(1+par.a*par.r2*par.h/par.a22)^2;

plot([g2_rat_ext,g2_rat_ext],[0.22,1],'Color',[grey grey grey],'Linewidth',2);


%plot TC bif curves

fpp=fimplicit(@(x,y) tcbif2(x,y,par),[0.001 1 0.001 1],'MeshDensity',500);

Xdata=fpp.XData;
Ydata=fpp.YData;

delete(fpp);

plot(Ydata(1:270),Xdata(1:270),'Linewidth',2,'Color',[grey grey grey]);


%plot SN tipping point curve

D=par.a11*par.a22-par.a21*par.a12;
S=((par.a22*par.r1-par.a12*par.r2-par.a21*par.r1+par.a11*par.r2)/D+1/(par.a*par.h))^2*par.h/4;

xvec=[0,0.22];
yvec=(S*D+(par.a21-par.a22)*xvec)/(par.a11-par.a12);

plot(yvec,xvec,'Color',[0.9290 0.6940 0.1250],'Linewidth',2) %coloured yellow for caution


%----------------
%plot the points at which we have made phase portraits

g1s=[0.05 0.05 0.05];
g2s=[0.3 0.49 0.52]; 

plot(g2s,g1s,'.','Color',[0.8500 0.3250 0.0980],'MarkerSize',20)


%----------------
%plot a point for error-free AI

plot(1,0,'.','Color',[0.4660 0.6740 0.1880],'MarkerSize',20)



box on
axis equal

ylim([0,1])
xlim([0,1])

set(gca,'FontSize',14)

set(gca, 'Color', 'none');


%uncomment this line to save the figure
%export_fig g1g2.pdf -transparent




