clear
a = arduino("COM3");
temperature = ((readVoltage(a,'A4')-0.5)*100);%turning voltage into temperature
time = 0;
figure
while (temperature>0) && (temperature<100)
    if ((18 <= temperature) && (temperature <= 24))% if the temperature is between 18 and 24 display green light
        writeDigitalPin(a,"D6",1)
        pause(1)
       
    elseif (temperature < 18)  % if temperatur eis less than 18 display amber light for 0.5 seconds
        writeDigitalPin(a,"D6",0)
        
        writeDigitalPin(a,"D4",1)
        pause(0.5)
        writeDigitalPin(a,"D4",0)
        pause(0.5)
    else 
        writeDigitalPin(a,"D6",0) % if temperature is greater than 24 display red light at 0.25 second intervals
        writeDigitalPin(a,"D2",1)
        pause(0.25)
        writeDigitalPin(a,"D2",0)
        pause(0.25)  
        writeDigitalPin(a,"D2",1)
        pause(0.25)
        writeDigitalPin(a,"D2",0)
        pause(0.25)
        
    end
    temperature = ((readVoltage(a,'A4')-0.5)*100)
    time = time +1;
    xlabel("time/s")
    ylabel("temperature/C")
    ylim([10 28])
    xlim([0 100])
    plot(time,temperature,'.-') % plotting line graph every iteration of the loop to create continous chart
    hold on
    
end
writeDigitalPin(a,"D6",0) % making sure green light is off once finished
