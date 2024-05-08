clear
a = arduino('COM4');
time = 0;
temperature = ((readVoltage(a,'A4')-0.5))*100%turning voltage into temperature
x = 0
while x == 0 % infinte loop
   
    Temp = zeros(1,61);% creating blank array for a minutes worth of values
    time = time + 1;
    for time = 1:61
        temperature = ((readVoltage(a,'A4')-0.5))*100;
        Temp(1,time) = temperature; % adding the value for temperature into blank array 
        average = (sum(Temp))/60; % getting the mean value
        pause(1)
    end
    average;
    if time > 60 % for every other iteratoion of 60 seconds after the first
        average2 = average;% resseting average variable
        for n = 1:61
        temperature = ((readVoltage(a,'A4')-0.5))*100;
        Temp(1,n) = temperature;
        average2 = (sum(Temp))/60;% same process as before
        pause(1)
        end
    average2;
    end
    tempchange = (average2 - average);
    expected = (tempchange*300) + average2;% expected change after 5 minutes
    rate = (tempchange*60);% change per minute
    disp(fprintf('the rate of temperature change per minute is %2.2f',rate))
    disp(fprintf('\nCurrent minute average temperature is %2.2f \n expected temperature in 5 minutes is %2.2f',average2,expected))% displaying process
    if rate >= 4
        writeDigitalPin(a,"D6",1)% red light if rate > 4
        writeDigitalPin(a,"D4",0)
        writeDigitalPin(a,"D2",0)
    elseif rate <= -4
        writeDigitalPin(a,"D6",0)% amber light if rate < -4
        writeDigitalPin(a,"D4",1)
        writeDigitalPin(a,"D2",0)
    else (rate < 4) && (rate > -4)% green light if between -4 and 4
        writeDigitalPin(a,"D6",0)
        writeDigitalPin(a,"D4",0)
        writeDigitalPin(a,"D2",1)
    end
   
end



   