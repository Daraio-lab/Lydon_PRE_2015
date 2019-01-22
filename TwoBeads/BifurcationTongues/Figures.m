set(0,'DefaultTextFontSize',16)
set(0,'DefaultAxesFontSize',16)
set(0,'DefaultTextFontName','times')
set(0,'DefaultAxesFontName','times')
set(0,'DefaultLineLineWidth',1.5)
set(0,'DefaultAxesLineWidth',1.5)
set(0,'DefaultLineMarkerSize',8)
set(0,'DefaultAxesBox','on')
set(0,'DefaultFigureColor','w');

xstr = 'Frequency [kHz]';
ystr = 'Drive Amp [microm]';

% width = 500;
% height = 293;
% set(gcf,'position',[0 height width height]);
% figure(1);
% %Total Power
% imagesc(Freq,Drive_Amp*1e6,20*log(TotalPower(4:end,:)))
% title('Total Power [dB]');
% set(gca,'Ydir','normal');
% xlabel(xstr);
% ylabel(ystr);
% colorbar;


% figure(2);
% %Total Power
% imagesc(Freq,Drive_Amp*1e6,20*log(LocalNormPower(4:end,:)))
% title('Local Norm Power [dB]');
% set(gca,'Ydir','normal');
% xlabel(xstr);
% ylabel(ystr);
% colorbar;

% figure(3);
% %Total Power
% imagesc(Freq,Drive_Amp*1e6,log(LocalPower))
% title('Local Power');
% set(gca,'Ydir','normal');
% xlabel(xstr);
% ylabel(ystr);

figure(3);
%Total Power
% hold off
width = 500;
height = 293;
set(gcf,'position',[0 height width height]);

imagesc(Freq/1000,Drive_Amp*1e6,20*log(MaxVelocity(4:end,:)/max(max(MaxVelocity))))
% title('MaxVelocity [dB]');
set(gca,'Ydir','normal');
set(gca,'ytick',[.02 .06 .1]);
% set(gca,'position','manual');
% xlim([6500 7800]);
xlabel(xstr);
ylabel(ystr);

h = colorbar;
set(h,'ytick',[-60,-40,-20,0]);


F0 = 2.9;

A = 9.7576e9;
mass = 0.028;
d0 = (F0/A)^(2/3);
d0 = d0*1e6;
omega_0 = sqrt(1.5*A^(2/3)*F0^(1/3)/mass)/2/pi;


% figure(1);
hold on
bif_ind = find(Amps);
gap_ind = find(Amps&GapIndicators);
plot(Omega(bif_ind)*omega_0/1000,Amps(bif_ind)*d0/sqrt(2),'k.',Omega(gap_ind)*omega_0,Amps(gap_ind)*d0,'r.');
% xlim(omega_0*[min(Omega) max(Omega)]);
% 
hold off
% figure(5);
% %Total Power
% imagesc(Freq,Drive_Amp*1e6,10*log(PkToPkVelocity(4:end,:)))
% title('PkToPkVelocity [dB]');
% set(gca,'Ydir','normal');
% xlabel(xstr);
% ylabel(ystr);
% colorbar;