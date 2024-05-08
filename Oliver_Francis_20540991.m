% Oliver Francis
%egyof1@nottingham.ac.uk
%% PRELIMINARY TASK - ARDUINO AND GIT INSTALLATION [10 MARKS]
clear
a = arduino("COM3");
for f = 1:10
    writeDigitalPin(a,'D10',1)
    pause(0.5)
    writeDigitalPin(a,'D10',0)
    pause(0.5)
end
%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]
clear
a = arduino("COM3")
fileID = fopen('cabin_temperature.txt','w'); %create a file to write the code into
time = 1:1:601; %create array with numbers 1 to 601
Voltage = zeros(1,601);
temperature = zeros(1,601);% creating blank arrays to fill in later
for f = 1:601
    Voltage(f) = readVoltage(a,'A4');
    
    temperature(f) = ((Voltage(f)-0.5)*100); %turning voltage into temeprature
end
Minimum = min(temperature) 
Maximum = max(temperature)
Average = mean(temperature) %using commands to get min max and average
plot(time,temperature) % plotting the graph
xlabel('time/S')
ylabel('temperature/C')% defining the axis' labels for the graph
A1 = datetime('now','TimeZone','local','Format','dd/MM/uuuu');
disp(fprintf(fileID,'Data logging initiated-%s\nLocation-Nottingham',A1))% writing first lines to the file
disp(fprintf,'Data logging initiated-%s\nLocation-Nottingham',A1)% writing firs tlines to the command window
n = 1;
D = 0;
for i = 0:10
    A3 = D;
    disp(fprintf(fileID,'\n\nMinute    \t\t %d',A3))% writing the output in a neat way
    disp(fprintf,'\n\nMinute    \t\t %d',A3)
    A2 = temperature(n);
    disp(fprintf(fileID,'\nTemperature\t\t %2.2f',A2))
    disp(fprintf, '\nTemperature\t\t %2.2f',A2)
    n = n+60;
    D = D+1;
end
A4 = Maximum;
A5 = Minimum;
A6 = Average;
disp(fprintf(fileID,'\n\nMax temp  \t\t%2.2fC',A4))% displaying end numbers in a neat way
disp(fprintf(fileID,'\nMin temp  \t\t%2.2fC',A5))
disp(fprintf(fileID,'\nAverage temp \t%2.2fC',A6))
disp(fprintf(fileID,'\n\nData logging terminated'))
disp(fprintf,'\n\nMax temp  \t\t%2.2fC',A4)
disp(fprintf,'\nMin temp  \t\t%2.2fC',A5)
disp(fprintf,'\nAverage temp \t%2.2fC',A6)
disp(fprintf,'\n\nData logging terminated')
%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]
clear
run("temp_monitor.m")




%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]
clear
run("temp_prediction.m")
% Insert answers here


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

% Overall, this project went well, I have gained many new skills to use in
% MATLAB and have learnt how to use an Arduino board. I have made many 
% changes and iterations to my code including starting completely from
% fresh for some tasks which helped me come at the problem from a new
% angle with the experience gained. The Arduino board at first was
% challenging to use as I didn’t know how everything connected together
% but I quicky understood how to use it and it became an easy tool to use
% and alter.

% I have improved most at visualising a problem and how I would implement
% it into code. This includes how many iterations of a loop I would need
% or what limitations to put on variables and how I can display them later
% on. The flowcharting helped also with planning what I would do before
% starting, this meant that I wouldn’t have to restart my code as I already
% had an idea of what to do.

%I was limited by my understanding of some commands, If I knew how they
% worked and how to adjust them rather than just putting them in place I
% would’ve been able to optimise my code better. Sometimes my code became
% a bit messy as I tried to patch up earlier mistakes or inefficiencies. 

%If I were to add future improvements to my code they would be to improve
% the efficiency of it as there are better ways of doing what I have done
% and I would learn some new methods of completing the tasks.



% Side note: I had this script added to git with a full list of commits but
% then I renamed it and it wiped all of them.
