% script that introduces  spectral analysis using an EEG trace sampled @ 50 Hz
%  ..................
%   ... relates to chapter-3 example1

close all; clear all;
load dpoae, Fs=20e3; 
% max_freq = 1e4;
% max_t = 0.2;
% time=[1:numel(dpoaets)]*(1/Fs);
% dpoaets = detrend(dpoaets);

% time-domain representation
% subplot(3,1,1),plot(time,dpoaets),xlabel('Time(s)'),grid,title('EEG trace'),xlim([0 max_t])

% % frequency-domain representation via FFT
% L=numel(dpoaets);
% Y = fft(dpoaets); %Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L.
% P2 = abs(Y/L);P1 = P2(1:round(L/2+1));
% P1(2:end-1) = 2*P1(2:end-1);
% %Define the frequency domain f and plot the single-sided amplitude spectrum P1.
% f = Fs*(0:round(L/2))/L;
% subplot(3,2,3),plot(f,P1),title('Single-Sided Amplitude Spectrum'),xlabel('f (Hz)'),ylabel('|P(f)|'),xlim([0 max_freq])
% 
% % frequency-domain representation via periodogram
% [pxx,faxis] = periodogram(dpoaets,hamming(L),L,Fs,'psd') ;
% subplot(3,2,4),plot(faxis,pxx),title('periodogram'),xlabel('f (Hz)'),ylabel('PSD'),xlim([0 max_freq])
% 
% % WELCH-technique for estimating PSD
% WINDOW=256;NOVERLAP=32;NFFT=256;[pxx,faxis] = pwelch(dpoaets,WINDOW,NOVERLAP,NFFT,Fs,'onesided');
% subplot(3,2,5),plot(faxis,pxx),xlabel('f (Hz)'),ylabel('PSD'),xlim([0 max_freq]),title('Welch-based PSD'),legend('32samples-overlap ')
% 
% WINDOW=256;NOVERLAP=200;NFFT=256;[pxx,faxis] = pwelch(dpoaets,WINDOW,NOVERLAP,NFFT,Fs,'onesided');
% subplot(3,2,6),plot(faxis,pxx),xlabel('f (Hz)'),ylabel('PSD'),xlim([0 max_freq]),title('Welch-based PSD'),legend('200samples-overlap')
% 

