clear
a = arduino('COM4');
time = 0;
temperature = ((readVoltage(a,'A4')-0.5))*100
x = 0
while x == 0 
   
    Temp = zeros(1,61);
    time = time + 1;
    for time = 1:61
        temperature = ((readVoltage(a,'A4')-0.5))*100;
        Temp(1,time) = temperature;
        average = (sum(Temp))/60;
        pause(1)
    end
    average;
    if time > 60
        average2 = average;
        for n = 1:61
        temperature = ((readVoltage(a,'A4')-0.5))*100;
        Temp(1,n) = temperature;
        average2 = (sum(Temp))/60;
        pause(1)
        end
    average2;
    end
    tempchange = (average2 - average);
    expected = (tempchange*300) + average2;
    rate = (tempchange*60);
    disp(fprintf('the rate of temperature change per minute is %2.2f',rate))
    disp(fprintf('\nCurrent minute average temperature is %2.2f \n expected temperature in 5 minutes is %2.2f',average2,expected))
    if rate >= 4
        writeDigitalPin(a,"D6",1)
        writeDigitalPin(a,"D4",0)
        writeDigitalPin(a,"D2",0)
    elseif rate <= -4
        writeDigitalPin(a,"D6",0)
        writeDigitalPin(a,"D4",1)
        writeDigitalPin(a,"D2",0)
    else (rate < 4) && (rate > -4)
        writeDigitalPin(a,"D6",0)
        writeDigitalPin(a,"D4",0)
        writeDigitalPin(a,"D2",1)
    end
   
end



   