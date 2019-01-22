% Build Plots

xstr = 'Frequency [Hz]';
ystr = 'Drive Amp [\mum]';

figure(1);
%Total Power
imagesc(Freq,Drive_Amp*1e6,20*log(TotalPower))
title('Total Power [dB]');
set(gca,'Ydir','normal');
xlabel(xstr);
ylabel(ystr);
colorbar;


figure(2);
%Total Power
imagesc(Freq,Drive_Amp*1e6,20*log(LocalNormPower))
title('Local Norm Power [dB]');
set(gca,'Ydir','normal');
xlabel(xstr);
ylabel(ystr);
colorbar;

% figure(3);
% %Total Power
% imagesc(Freq,Drive_Amp*1e6,log(LocalPower))
% title('Local Power');
% set(gca,'Ydir','normal');
% xlabel(xstr);
% ylabel(ystr);

figure(4);
%Total Power
imagesc(Freq,Drive_Amp*1e6,10*log(MaxVelocity))
title('MaxVelocity [dB]');
set(gca,'Ydir','normal');
xlabel(xstr);
ylabel(ystr);
colorbar;

figure(5);
%Total Power
imagesc(Freq,Drive_Amp*1e6,10*log(PkToPkVelocity))
title('PkToPkVelocity [dB]');
set(gca,'Ydir','normal');
xlabel(xstr);
ylabel(ystr);
colorbar;