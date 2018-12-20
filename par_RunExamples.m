%% Parallel RunExamples.m 
% parallelizes the simulations and saves the output (copies of each other)
% to different files named to reflect the parameter that was modified

%%  call and run simulations
close all
clear
clc
parfor sim = 1:10
    % [pm] = defaultparamsCA1(); %T[=]s
    [pm] = defaultparamsCA1_tst0noise();
    T = 1; %[=]s length of simulation
    NE = 800; % number of excitatory cells
    NI = 160; % number of inhibitory interneurons
    
    inpseq.slp = 3; %[=]ms slope of current activation (bell shaped)
    starts =  0.10:0.22:T;
    inpseq.on =  starts*1000; % [=] ms sequence of input starts
    inpseq.length = 50; % [=] ms sequence of input ends
    
    opt.nonoise = 1; % if no noise added, turn to 1
    opt.novar = 0; % if no variance in synaptic weightsm turn to 1
    opt.noiseprc = 100; % percent of standard deviation of the noise to use in the simulation
    opt.storecurrs = 1; % if you want the output to include the synaptic currents
    
    opt.seqassign = 1; % if you want to choose 10 cells that are going to be part of a sequence
    pm.dcbias = 2; % how much you want to bias the DC of cells that are selected to be in the sequence
    
    % idc = 1;
    % s = ['example_',num2str(idc),'.mat'];
    % disp(s)
    [conn,vbar,veg,lfp,tsp_E,tsp_I,Isynbar,inp,seqs]= ...
        NetworkRunSeqt_tst0noise(pm,inpseq,NE,NI,T,opt);
    
    % save the outputs of each simulation
    parsave(sprintf('sim%d_tst0noise.mat',sim),'conn','idc','inp','inpseq','Isynbar','lfp','NE','NI',...
    'opt','pm','s','seqs','starts','T','tsp_E','tsp_I','vbar','veg')
end