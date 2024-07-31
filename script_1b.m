% script that introduces  spectral analysis using an EEG trace sampled @ 50 Hz
%  ..................
%   ... relates to chapter-3 example1

close all; clear all;
load NIRSData, Fs=10; max_freq = 5; %25
figure;
for i=1:2
    data = NIRSData(:, i);
    time=[1:numel(data)]*(1/Fs);
    [b, a] = butter(3, Fs/200,'high');
    filtered_data = filtfilt(b, a, data);
    
    % time-domain representation
    subplot(3,1,1), plot(time,filtered_data, 'DisplayName', num2str(i)), xlabel('Time(s)'), grid,title('EEG trace'), hold on; legend;
    % frequency-domain representation via FFT
    L=numel(filtered_data);
    Y = fft(filtered_data); %Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L.
    P2 = abs(Y/L);P1 = P2(1:round(L/2+1));
    P1(2:end-1) = 2*P1(2:end-1);
    % Define the frequency domain f and plot the single-sided amplitude spectrum P1.
    f = Fs*(0:round(L/2))/L;
    subplot(3,2,3),plot(f,P1, 'DisplayName', num2str(i)),title('Single-Sided Amplitude Spectrum'),xlabel('f (Hz)'),ylabel('|P(f)|'),xlim([0 max_freq]), legend
    hold on;
    % frequency-domain representation via periodogram
    [pxx,faxis] = periodogram(filtered_data,hamming(L),L,Fs,'psd') ;
    subplot(3,2,4),plot(faxis,pxx, 'DisplayName', num2str(i)),title('periodogram'),xlabel('f (Hz)'),ylabel('PSD'),xlim([0 max_freq]), legend
    hold on;
    % WELCH-technique for estimating PSD
    WINDOW=256;NOVERLAP=32;NFFT=256;[pxx,faxis] = pwelch(filtered_data,WINDOW,NOVERLAP,NFFT,Fs,'onesided');
    subplot(3,2,5),plot(faxis,pxx, 'DisplayName', num2str(i)),xlabel('f (Hz)'),ylabel('PSD'),xlim([0 max_freq]),title('Welch-based PSD (32samples-overlap)'), legend
    hold on;
    WINDOW=256;NOVERLAP=200;NFFT=256;[pxx,faxis] = pwelch(filtered_data,WINDOW,NOVERLAP,NFFT,Fs,'onesided');
    subplot(3,2,6),plot(faxis,pxx, 'DisplayName', num2str(i)),xlabel('f (Hz)'),ylabel('PSD'),xlim([0 max_freq]),title('Welch-based PSD (200samples-overlap)'),legend
    hold on;
end
