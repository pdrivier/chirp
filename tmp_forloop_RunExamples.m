%% tmp wrapper for RunExamples_tst0noise.m 
clear all
close all
clc
for simulation = 1:10 
    sprintf('sim%d_begin',simulation)
    
    %RunExamples_tst0noise_simdur2sec
    %RunExamples_connEEincrease_gmaxEdenom5
    %RunExamples_connEEincrease_gvarEEdecreasepoint0005
    %RunExamples_connEEincrease_gvarEEdecreasepoint00001
    %RunExamples_connEEincrease_gmaxEEsameasgmaxIE
    %RunExamples_connEEincrease_gmaxEEsameasgmaxIEtimes4
    %RunExamples_connEEincrease_gmaxEEsameasgmaxIEtimes2
    %RunExamples_connEEincrease_gmaxEEsameasgmaxIEtimes1point5
    %RunExamples_Edctimes2
    %RunExamples_Edctimes4
    %RunExamples_EdcsameasIdc
    %RunExamples_Idctimes2
    RunExamples_Edctimes2Idctimes2
    
    save(sprintf('sim%d_Edctimes2Idctimes2_simdur2sec.mat',simulation),'conn','idc','inp','inpseq','Isynbar','lfp','NE','NI',...
    'opt','pm','s','seqs','starts','T','tsp_E','tsp_I','vbar','veg')
   
end 