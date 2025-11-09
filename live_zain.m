clear  all; close  all; 

a = arduino('COM6', 'uno'); 
% https://www.mathworks.com/videos/plotting-live-data-of-atemperature-sensor-using-arduino-and-matlab-121317.html 
figure
h = animatedline;
ax = gca;
ax.YGrid =  'on';
ax.YLim = [-0.1 5];
title('Sound sensor voltage vs time (live)');
ylabel('Voltage [volt]');
xlabel('Time [HH:MM:SS]');

max_samples = 1000;  % how many times do we check the sound sensor? 
filter_size = 15;  % how many samples do we use in  the moving average? 
threshold_value = 1.15;


tic %start timer
s = 1;
stop = false; 
while  ~stop % Read current voltage value 
    voltage = readVoltage(a,'A2'); 
    % Get current time 
    t = toc; 
    % Add points to animation 
    addpoints(h,datenum(t),voltage) 
    % Update axes 
    ax.XLim = datenum([t-seconds(15) t]); 
    datetick('x','keeplimits') 
    drawnow 
    % Check stop condition
    if s == 1000
        stop = true;
    else
        s = s + 1;
    end
end

% for i = 1:max_samples 
    % sound_data = readVoltage(a,'A2'); 
    % time_data = toc;
    % addpoints(h,time_data,sound_data)
    % ax.XLim = datenum([time_data-seconds(15) time_data]); 
    % drawnow
% end 

% stop = false; 
% startTime = datetime('now'); 
% while  ~stop % Read current voltage value 
    % voltage = readVoltage(a,'A2'); 
    
    % Get current time 
    % t =  datetime('now')  -  startTime; 
    % Add points to animation 
    % addpoints(h,datenum(t),voltage) 
    % Update axes 
    % ax.XLim = datenum([t-seconds(15) t]); 
    % datetick('x','keeplimits') 
    % drawnow 
    % Check stop condition 
    % stop = readDigitalPin(a,'D6'); 
% end