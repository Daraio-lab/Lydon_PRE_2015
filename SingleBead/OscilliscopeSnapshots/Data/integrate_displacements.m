%build Displacements 
snapshotAT = 10;

Displacements_Short = zeros(2048,74);
Displacements_Middle = zeros(2048,74);
Displacements_Long = zeros(2048,74);

cutoff = 1500;

[b,a] = butter(4,cutoff*Time_Short(2),'high');
for i = 1:74;
    Displacements_Short(:,i) = cumsum(Velocities_Short(:,i))*Time_Short(2);
    Displacements_Short(:,i) = filtfilt(b,a,Displacements_Short(:,i));
end

[b,a] = butter(4,cutoff*Time_Middle(2),'high');
for i = 1:74;
    Displacements_Middle(:,i) = cumsum(Velocities_Middle(:,i))*Time_Middle(2);
    Displacements_Middle(:,i) = filtfilt(b,a,Displacements_Middle(:,i));
end

[b,a] = butter(4,cutoff*Time_Long(2),'high');
for i = 1:74;
    Displacements_Long(:,i) = cumsum(Velocities_Long(:,i))*Time_Long(2);
    Displacements_Long(:,i) = filtfilt(b,a,Displacements_Long(:,i));
end


plot(Time_Middle,Displacements_Middle(:,10))
plot(Time_Long,Displacements_Long(:,10))
plot(Time_Short,Displacements_Short(:,10))


filename = 'poincare.gif';
indstart = 250;
period = 1/6850;
dt = Time_Short(2);
points = ceil([1:25]*period/dt)+indstart;

%Change units for displacement to microns
Displacements_Short = Displacements_Short*1e3;
u = Displacements_Short(:,10);
v = Velocities_Short(:,10);
xlimits = max(max(abs(Displacements_Short)));
ylimits = max(max(abs(Velocities_Short)));

linehandle = plot(u(points),v(points),'.');
xlim([-1*xlimits xlimits]);
ylim([-1*ylimits ylimits]);
xlabel('Displacement [\mum]');
ylabel('mm/s');
title('Poincare Section - Subharmonic Bifurcation');
whitebg('w');
set(gcf,'color','w');

for i=10:1:(74/2); 
    u = Displacements_Short(:,i);
    v = Velocities_Short(:,i);

    set(linehandle,'xdata', u(points), 'ydata' , v(points));

    pause(.2);
    %if(exist('make_movie','var'));
    drawnow
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i==10;
        imwrite(imind,cm,filename,'gif','Loopcount',inf,'WriteMode','overwrite');
        %imwrite(imind,cm,filename,'gif','Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',.015');
    end
end

