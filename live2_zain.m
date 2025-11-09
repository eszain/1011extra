clear  all; close  all;

a = arduino('COM6',  'uno');

tic %start timer

max_samples = 1000;  % how many times do we check the sound sensor? 
filter_size = 15;  % how many samples do we use in  the moving average? 
threshold_value = 1.15;

close all;

tic %start timer 

for  i = 1:max_samples 
    sound_data(i) = readVoltage(a,'A2'); 
    time_data(i) = toc; 
end 