function [frate] = firing_rate(data_struct,simdur,fs)

%(spktrns,movingwin,fs,pop_avg)
%spktrns      nxm matrix, of spike trains for some population of neurons,
              %where n corresponds to time samples and m are different cells
%movingwin    1x2 vector, in seconds, in the form [window winstep], i.e.
              %length of moving window and the step size
%fs           scalar, sampling rate, in Hz
%pop_avg      logical, if =0, return matrix of firing rates for multiple
              %cells; if =1, return vector average of firing rates for
              %population of cells

              
%frate        vector of average firing rates for the combination of given 
              %window and step sizes

% [nsamples, ncells]=size(spktrns);            
% nwin=round(fs*movingwin(1)); %number of windows to calculate firing rate 
% nstep=round(fs*movingwin(2));%number of samples to go step through
% 
% winstart=0.0001:nstep:nsamples-nwin+1; %start times for each window  
% nw=length(winstart); 
% 
% if pop_avg
%     frate=zeros(nw,1);
%     for w = 1:nw
%         indx=winstart(w):winstart(w)+nwin-1;
%         datawin=spktrns(indx,:);
%         frate(w)=sum(datawin)/movingwin(1);
%     end
% else
%     frate=zeros(nw,ncells);
%     for w=1:nw
%         indx=winstart(w):winstart(w)+nwin-1;
%         for c=1:ncells
%             datawin=spktrns(indx,c);
%             frate(w,c)=sum(datawin)/movingwin(1);
%         end
%     end
% end
t = 0.001:1/fs:simdur; %create time vector for the duration of the simulation
%ncells = numel(unique(data_struct.celln));

spkcounts=histc(data_struct.times(nrn),t);
frate=spkcounts./0.1;

figure()
bar(t,spkcounts)
xlabel('time (sec)')
ylabel('# of spikes')

figure()
plot(t,frate)
xlabel('time (sec)')
ylabel('population firing rate')

end