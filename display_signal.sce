
// Visualisation du signal

loadmatfile('EEG_data.mat’);

x = Normal(25,:);
y = Abnormal(90,:);

N  = 4096; 
Fs = 173.6; //Frequence d'échantillonnage

T  = N/Fs; 
N  = T*Fs; 
Fs = N/T;

t  = (0:N-1)*(1/Fs);

figure; 
title('EEG signal');

//Plot Normal
subplot(2,1,1);
plot(t,x);xlabel('Time (seconds)');ylabel('EEG(t) (\muV)');

//Plot Abnormal
subplot(2,1,2);
plot(t,y);xlabel('Time (seconds)');ylabel('EEG(t) (\muV)');
