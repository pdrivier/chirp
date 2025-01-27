%%  call and run simulations
close all
clear
clc
[pm] = defaultparamsCA1_Edctimes2Idctimes2(); %T[=]s
T = 5; %[=]s length of simulation
NE = 800; % number of excitatory cells
NI = 160; % number of inhibitory interneurons

opt.nonoise = 0; % if no noise added, turn to 1
opt.novar = 0; % if no variance in synaptic weightsm turn to 1
opt.noiseprc = 100; % percent of standard deviation of the noise to use in the simulation
opt.storecurrs = 1; % if you want the output to include the synaptic currents
opt.noinput = 1; % if don't want inputs, set to 1

if ~opt.noinput
    inpseq.slp = 3; %[=]ms slope of current activation (bell shaped)
    starts =  1.1:0.22:T; % also put inside if statement to reduce T = 1
    inpseq.on =  starts*1000; % [=] ms sequence of input starts
    inpseq.length = 50; % [=] ms sequence of input ends
else
    inpseq.slp =0;
    starts =0;
    inpseq.on =0;
    inpseq.length =0;
end
opt.seqassign = 0; % if you want to choose 10 cells that are going to be part of a sequence
pm.dcbias = 2; % how much you want to bias the DC of cells that are selected to be in the sequence
 
idc = 1;
s = ['example_',num2str(idc),'.mat'];
disp(s)

[conn,vbar,veg,lfp,tsp_E,tsp_I,Isynbar,inp,seqs]= ...
        NetworkRunSeqt_simdur5sec_noinput(pm,inpseq,NE,NI,T,opt);

