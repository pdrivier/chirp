function [p] = defaultparamsCA1_weakPING02_hippobook()

%params
p.CE = 200;     % capacitance, [=]pF
p.glE = 10;     % leak conductance, [=]nS
p.ElE = -58;    % leak current reversal potential, [=]mV
p.aE = 2;       % coefficient for decay??
p.bE = 100;     % coefficient
p.slpE = 2;     % change in voltage, [=]mV
p.twE = 120;    % theta resonance, [=]ms; 
p.VtE = -50;    % ?
p.VrE = -46;    % ?

p.CI = 200;
p.glI = 10;
p.ElI = -70;
p.aI = 2;
p.bI = 10;
p.slpI = 2;
p.twI = 30;
p.VtI = -50;
p.VrI = -58;

% coefficients for Ornstein-Uhlenbeck process
p.gnoiseE = 0.01; %MOD: does this correspond to g_stoch_E in book chapter?
p.gnoiseI = 90; 

% EtoE 
p.tauEr = 0.5; % timescale rise for excitatory syn on pyr cells
p.tauEd = 3; % timescale decay AMPA-mediated synapse %MOD: =tau_(D,stoch,E)? in book chapter
% EtoB
p.tauEIr = 0.9; 
p.tauEId = 3; %EPSP on inrn faster than on principal cells
% BtoB 
p.tauIr = 0.3;
p.tauId = 2;  % Bartos et al 2002
% BtoP is slower than BtoB
p.tauIEr = 0.3;
p.tauIEd = 3.5; 

%MOD: three params below have been modified as per book chapter
p.gmaxII = 0.5/(80/100); %3/(80/100)
p.gmaxEI = 0.5/(30/100); %2/(30/100)
p.gmaxIE = 1.5/(60/100); %5/(60/100)
p.gmaxEE = p.gmaxEI/10;%1on1 syn strength /percent synch efficacy

p.VrevE = 0; % mV reversal of excitatory Isyn
p.VrevI = -80;% mV rev of inhibitory Isyn

p.gvarEE = 0.01; % paper says = 0.001?, [=]nS
p.gvarII = 0.01; % paper says = 0.0234?

p.gvarEI = 0.01; % paper says = 0.0083? 
p.gvarIE = 0.01; % paper says = 0.0521?

p.DCstdI = 0.1;
p.DCstdE = 0.1;

p.Edc = 1.25; %MOD: as per I_E=1.25 in book chapter
p.jmpE = 210;
p.Idc = 180;
p.jmpI = 700;

p.seqsize = 10;
p.dcbias = 2;
return