clear
a = arduino("COM3");
temperature = ((readVoltage(a,'A4')-0.5)*100);
time = 0;
figure
while (temperature>0) && (temperature<100)
    if ((18 <= temperature) && (temperature <= 24))
        writeDigitalPin(a,"D6",1)
        pause(1)
       
    elseif (temperature < 18)
        writeDigitalPin(a,"D6",0)
        
        writeDigitalPin(a,"D4",1)
        pause(0.5)
        writeDigitalPin(a,"D4",0)
        pause(0.5)
    else 
        writeDigitalPin(a,"D6",0)
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
    plot(time,temperature,'.-')
    hold on
    
end
writeDigitalPin(a,"D6",0)
yeah