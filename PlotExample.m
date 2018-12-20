%% summary plots - samples of default case
% close all
clear
s = 'sim1_Edctimes2_simdur2sec'; % original var definition: 'example_1.mat';
load(s);
rpick = 3; % select ripple to plot (original val = 2)
% inputs, rastergram, lfp and filteredLFP
tout = 0:0.001:T; 
[ripples,spcount,recruit,filtLFP] = CountRipples(T,lfp,tsp_E,tsp_I,NE,NI,inpseq);
rpt = ripples.time(rpick); %[=]s
disp(rpt)
rpl = ripples.length(rpick)/1000; %[=]s
xl = rpt-0.02;
xr = rpt+rpl+0.02;

figure()
plot(tout,veg.E,'-k',tout,veg.I,'-r')
title('Example voltage')
ylabel('mV')
xlabel('time [=] s');
xlim([xl xr]);

% xl = rpt-0.02;
% xr = rpt+rpl+0.02;
k1 = find(tout>=xl,1);
k2 = find(tout>=xr,1);
X = k1:k2;
figure()
subplot(311)
plot(tout(X),inp.Itrace(1,X),'-r',tout(X),inp.Etrace(1,X),'-k');
xlim([xl xr]);
title('current input from CA3');
ylabel('current (pA)')
legend('CA1 interneuron','CA1 pyramidal');
subplot(312)
plot(tsp_E.times,tsp_E.celln+NI,'.k',tsp_I.times,tsp_I.celln,'.r');
xlim([xl xr]);
title('CA1 spiking activity');
ylabel('cell #')
subplot(313)
tk = tout(X);
l1 = lfp(X); % raw lfp
l2 = filtLFP(X); % filtered lfp
%plot(tk,[l1; l2]')
% set(gca,'xlimmode','manual');
xlim([xl xr]);
plotyy(tout(X),lfp(X),tout(X),filtLFP(X))
title('CA1 LFP');
xlabel('time (sec)');
ylabel('voltage (mV)')
legend('raw','filtered')

tx = 0:0.0005:T;
figure()
subplot(411)
plot(tout,inp.Itrace,'-r',tout,inp.Etrace,'-k');
subplot(412)
hist(tsp_E.times,tx);
xlim([tx(1) tx(end)]) %xlim([3.5 3.6]);
title('CA1 pyramidal cell multiunit activity');
ylabel('spike count');
subplot(413)
hist(tsp_I.times,tx);
xlim([tx(1) tx(end)]) % xlim([3.5 3.6]);
title('CA1 interneuron multiunit activity');
ylabel('spike count');
subplot(414)
% plot(tout,filtLFP);
plotyy(tout,lfp,tout,filtLFP)
title('CA1 filtered lfp')
xlabel('time (sec)')
xlim([tx(1) tx(end)]) % xlim([3.5 3.6]);

figure()
% plot(tout,filtLFP);
plot(tsp_E.times,tsp_E.celln+NI,'.k',tsp_I.times,tsp_I.celln,'.r')
title('Raster Pyr and Int')
legend('pyr','int')
ylabel('cell #')
xlabel('time (sec)')
xlim([tx(1) tx(end)]) % xlim([3.5 3.6]);


