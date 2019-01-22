% build paper figures 
set(0,'DefaultTextFontSize',16)
set(0,'DefaultAxesFontSize',16)
set(0,'DefaultTextFontName','times')
set(0,'DefaultAxesFontName','times')
set(0,'DefaultLineLineWidth',1.5)
set(0,'DefaultAxesLineWidth',1.5)
set(0,'DefaultLineMarkerSize',8)
set(0,'DefaultAxesBox','on')
set(0,'DefaultFigureColor','w');

width = 500;
height = 293;

i = 20;
figure(1)
set(gcf,'position',[0 height width height]);
linehandle = plot(Time_Short*1e3,Velocities_Short(:,i));
limits = [-max(max(abs(Velocities_Short))) max(max(abs(Velocities_Short)))];
ylim(limits);
xlim(1e3*[min(Time_Short) max(Time_Short(1:end/3))])
% title(strcat(['6.85kHz B = ' num2str(Drive_Amp(i)*1e6) '\mum']));
ylabel('Velocity [mm/s]');
xlabel('Time (ms)');

figure(2)
set(gcf,'position',[0 0 width height]);
linehandle2 = semilogy(f/1000,pxx(:,i));
% title('PSD');
xlabel('Freq');
ylabel('PSD [(mm/s)^2/kHz]');
limits = [min(min(pxx)) max(max(pxx))]*10;
xlim([0 12]);
ylim(limits);

j = 30;
figure(3)
set(gcf,'position',[width height width height]);
linehandle = plot(Time_Short*1e3,Velocities_Short(:,j));
limits = [-max(max(abs(Velocities_Short))) max(max(abs(Velocities_Short)))];
ylim(limits);
xlim(1e3*[min(Time_Short) max(Time_Short(1:end/3))])
% title(strcat(['6.85kHz B = ' num2str(Drive_Amp(i)*1e6) '\mum']));
ylabel('Velocity [mm/s]');
xlabel('Time (ms)');

figure(4)
set(gcf,'position',[width 0 width height]);
linehandle2 = semilogy(f/1000,pxx(:,j));
% title('PSD');
xlabel('Freq');
ylabel('PSD [(mm/s)^2/kHz]');
limits = [min(min(pxx)) max(max(pxx))]*10;
xlim([0 12]);
ylim(limits);

figure(5)
set(gcf,'position',[2.5*width height width height]);
linehandleMax = plot(Drive_Amp*1e6,Velocities_Max,'k.-',Drive_Amp(i)*1e6,Velocities_Max(i),'rx',Drive_Amp(j)*1e6,Velocities_Max(j),'bx');
set(linehandleMax(1),'linewidth',.5);
ylabel('Max Velocity [mm/s]');
xlabel('Drive Amplitude (\mum)');
set(gca,'ytick',[0 1 2 3],'xtick',[0,.05,.1])

figure(8)
set(gcf,'position',[2.5*width height width height]);
linehandleMax = plot(Drive_Amp*1e6,1000*.028/1000^2*Total_Power,'k.-',Drive_Amp(i)*1e6,1000*.028/1000^2*Total_Power(i),'rx',Drive_Amp(j)*1e6,1000*.028/1000^2*Total_Power(j),'bx');
set(linehandleMax(1),'linewidth',.5);
ylabel('Energy [mJ]');
xlabel('Drive Amplitude (\mum)');
ylim([0 .6]);
set(gca,'ytick',[0 .2 .4 .6],'xtick',[0,.05,.1])



integrate_displacements_forFigures;
hold off
figure(6);
u = Displacements_Short(:,i);
v = Velocities_Short(:,i);
set(gcf,'position',[1.5*width 2*height height*1.2 height]);
linehandle = plot(u(points),v(points),'.');
xlim([-1*xlimits xlimits]);
ylim([-1*ylimits ylimits]);
xlabel('Displacement [\mum]');
ylabel('Velocity mm/s');
% title('Poincare Section - Subharmonic Bifurcation');
% whitebg('w');
set(gcf,'color','w');

figure(7);
% hold on
u = Displacements_Short(:,j);
v = Velocities_Short(:,j);
set(gcf,'position',[.5*width 2*height height*1.2 height]);
linehandle = plot(u(points),v(points),'.');
xlim([-1*xlimits xlimits]);
ylim([-1*ylimits ylimits]);
xlabel('Displacement [\mum]');
ylabel('Velocity mm/s');
% title('Poincare Section - Subharmonic Bifurcation');
% whitebg('w');
set(gcf,'color','w');