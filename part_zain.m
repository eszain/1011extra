clear  all; close  all; 

a = arduino('COM6', 'uno');
% https://www.mathworks.com/videos/plotting-live-data-of-atemperature-sensor-using-arduino-and-matlab-121317.html 
figure 

max_samples = 100;  % how many times do we check the sound sensor? 
filter_size = 15;  % how many samples do we use in  the moving average? 
threshold_value = 1.15;

tic
for  i = 1:max_samples 
    sound_data(i) = readVoltage(a,'A2');
    if sound_data(i) > 1.5
        sound_data(i) = 1;
    else
        sound_data(i) = 0;
    end
    time_data(i) = toc; 
end


% Plot the threshold graph
plot(time_data,sound_data)

% Labels
ylabel('Voltage [volt]');
xlabel('Time [HH:MM:SS]');