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

stop = false; 
startTime = datetime('now'); 
while  ~stop 
    % Read current voltage value 
    voltage = readVoltage(a,'A2'); 
    % Get current time 
    t =  datetime('now')  -  startTime; 
    % Add points to animation 
    addpoints(h,datenum(t),voltage) 
    % Update axes 
    ax.XLim = datenum([t-seconds(15) t]); 
    datetick('x','keeplimits') 
    drawnow 
    % Check stop condition 
    stop = readDigitalPin(a,'D6'); 
end