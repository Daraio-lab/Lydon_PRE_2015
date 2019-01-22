% Build Plots

xstr = 'Frequency [Hz]';
ystr = 'Drive Amp [\mum]';
figure(1);
%Total Power
imagesc(Freq,Drive_Amp*1e6,20*log(TotalPower(4:end,:)))
title('Total Power [dB]');
set(gca,'Ydir','normal');
xlabel(xstr);
ylabel(ystr);
colorbar;


figure(2);
%Total Power
imagesc(Freq,Drive_Amp*1e6,20*log(LocalNormPower(4:end,:)))
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
imagesc(Freq,Drive_Amp*1e6,10*log(MaxVelocity(4:end,:)))
title('MaxVelocity [dB]');
set(gca,'Ydir','normal');
xlabel(xstr);
ylabel(ystr);
colorbar;

figure(5);
%Total Power
imagesc(Freq,Drive_Amp*1e6,10*log(PkToPkVelocity(4:end,:)))
title('PkToPkVelocity [dB]');
set(gca,'Ydir','normal');
xlabel(xstr);
ylabel(ystr);
colorbar;