% Oliver Francis
%egyof1@nottingham.ac.uk
%% PRELIMINARY TASK - ARDUINO AND GIT INSTALLATION [10 MARKS]
clear
a = arduino("COM3")
for f = 1:10
    writeDigitalPin(a,'D10',1)
    pause(0.5)
    writeDigitalPin(a,'D10',0)
    pause(0.5)
end
%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]
fileID = fopen('cabin_temperature.txt','w');
time = 1:1:601;
Voltage = zeros(1,601);
temperature = zeros(1,601);
for f = 1:601
    Voltage(f) = readVoltage(a,'A4');
    
    temperature(f) = ((Voltage(f)-0.5)*100);
end
Minimum = min(temperature) 
Maximum = max(temperature)
Average = mean(temperature)
plot(time,temperature)
xlabel('time/S')
ylabel('temperature/C')
A1 = datetime('now','TimeZone','local','Format','dd/MM/uuuu');
disp(fprintf(fileID,'Data logging initiated-%s\nLocation-Nottingham',A1))
n = 1;
D = 0;
for i = 0:10
    A3 = D;
    disp(fprintf(fileID,'\n\nMinute    \t\t %d',A3))
    A2 = temperature(n);
    disp(fprintf(fileID,'\nTemperature\t\t %2.2f',A2))
    n = n+60;
    D = D+1;
end
A4 = Maximum;
A5 = Minimum;
A6 = Average;
disp(fprintf(fileID,'\n\nMax temp  \t\t%2.2fC',A4))
disp(fprintf(fileID,'\nMin temp  \t\t%2.2fC',A5))
disp(fprintf(fileID,'\nAverage temp \t%2.2fC',A6))
disp(fprintf(fileID,'\n\nData logging terminated'))
%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]
doc sprintf
% Insert answers here


%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]

% Insert answers here


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

% Insert answers here