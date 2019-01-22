set(0,'DefaultTextFontSize',16)
set(0,'DefaultAxesFontSize',16)
set(0,'DefaultTextFontName','times')
set(0,'DefaultAxesFontName','times')
set(0,'DefaultLineLineWidth',1.5)
set(0,'DefaultAxesLineWidth',2)
set(0,'DefaultLineMarkerSize',8)
set(0,'DefaultAxesBox','on')
set(0,'DefaultFigureColor','w');

F0 = 4.5;

A = 9.7576e9*sqrt(2);
mass = 0.028;
d0 = (F0/A)^(2/3);
d0 = d0*1e6;
omega_0 = sqrt(1.5*A^(2/3)*F0^(1/3)/mass)/2/pi;

figure(1);
bif_ind = find(Amps);
gap_ind = find(Amps&GapIndicators);
plot(Omega(bif_ind)*omega_0,Amps(bif_ind)*d0,'.',Omega(gap_ind)*omega_0,Amps(gap_ind)*d0,'r.');
xlim(omega_0*[min(Omega) max(Omega)]);
ylim(d0*[0 .6]);
xlabel('Non-Dim Freq');
ylabel('Critical Drive Amp [\mum]');

%  figure(2);
%  gap_ind = find(GapIndicators);
%  plot(Omega,Amps,'.',Omega(gap_ind),Amps(gap_ind),'r.');