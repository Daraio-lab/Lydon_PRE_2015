
make_movie = 1;
% if(exist('make_movie','var'));
%     filename = 'scope.gif';
% end
filename = 'scope.gif';

subplot(3,4,[1:3 5:7])
linehandle = plot(Time_Short,Velocities_Short(:,2));
limits = [-max(max(abs(Velocities_Short))) max(max(abs(Velocities_Short)))];
ylim(limits*1.1);
xlim([min(Time_Short) max(Time_Short)])
title('Bifurcation Demonstration\newline              6.85kHz ');
ylabel('Bead Velocity');
xlabel('Time (ms)');

subplot(3,4,4)
linehandleMax = plot(Drive_Amp*1e6,Velocities_Max,Drive_Amp(1)*1e6,Velocities_Max(1),'rx');
ylabel('Max Velocity');
xlabel('Drive Amplitude (\mum)');


subplot(3,4,8)
linehandleLocalNormPower = plot(Drive_Amp*1e6,LocalNormPower,Drive_Amp(1)*1e6,LocalNormPower(1),'rx');
ylabel('Drive Power');
xlabel('Drive Amplitude (\mum)');
ylim([0 1.05]);


subplot(3,4,12)
linehandleTotalPower= plot(Drive_Amp*1e6,Total_Power,Drive_Amp(1)*1e6,Total_Power(1),'rx');
ylabel('Total Power');
xlabel('Drive Amplitude (\mum)');

subplot(3,4,9:11)
linehandle2 = semilogy(f/1000,pxx(:,1));
% title('PSD');
xlabel('Freq');
ylabel('PSD [(mm/s)^2/kHz]');
limits = [min(min(pxx)) max(max(pxx))]*10;
xlim([0 12]);
ylim(limits);


% figure(1)
% set(gcf,'Color','None');
for i=1:1:74; 
    set(linehandle, 'ydata', Velocities_Short(:,i));
    set(linehandleMax(2), 'xdata',Drive_Amp(i)*1e6, 'ydata', Velocities_Max(i));
    set(linehandleLocalNormPower(2),'xdata',Drive_Amp(i)*1e6, 'ydata', LocalNormPower(i));
    set(linehandleTotalPower(2), 'xdata',Drive_Amp(i)*1e6,'ydata', Total_Power(i));
    set(linehandle2, 'ydata', pxx(:,i));
    %pause(.2);
%     
    %if(exist('make_movie','var'));
    drawnow
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i==1;
        imwrite(imind,cm,filename,'gif','Loopcount',inf,'WriteMode','overwrite');
        %imwrite(imind,cm,filename,'gif','Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',.15');
    end
end


