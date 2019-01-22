% plot

% imagesc(Drive_Amp,FrequencyHz,Velocity_Bending)
figure
set(gcf,'position',[400 500 500 293])
imagesc(FrequencyHz/1000,Drive_Amp/10^-9,Velocity_Bending')
set(gca,'Ydir','normal');
ylabel('Drive Amplitude [nm]');
xlabel('Frequency [kHz]');
xlim([3.4 4.4])
% 
% figure
% for i = 1:36;
%     Velocity_Norm = Velocity_Bending(:,i)/Drive_Amp(i);
% %     Velocity_Norm = Velocity_Bending(:,i)/sum(Velocity_Bending(:,i));
% end
% imagesc(FrequencyHz/1000,Drive_Amp/10^-9,Velocity_Norm')
% set(gca,'Ydir','normal');
% ylabel('Drive Amplitude [nm]');
% xlabel('Frequency [kHz]');


figure
set(gcf,'position',[400 500 500 293])
hold on
for i = 1:6:36;
    plot(FrequencyHz/1000, Velocity_Bending(:,i))
    xlabel('Freq [kHz]');
    ylabel('Velocity [mm/s]');
    title('Single Bead - Bending');
    ylim([0 max(Velocity_Bending(:,36))]);
    xlim([3.3 4.5])
end
hold off
print('-depsc2','bending_curves.eps');

% figure
% 
% figure
% for i = 1:6:36;
%     hold on
%     plot(FrequencyHz/1000, Velocity_Bending(:,i)/sum(Velocity_Bending(:,i)))
%     xlabel('Freq [kHz]');
%     ylabel('Velocity [mm/s]');
%     title('Single Bead - Normalized Bending');
% end
% hold off