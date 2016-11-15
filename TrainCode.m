%Train Code - V .1--
clear; clc; close; delete(instrfindall);
a = arduino('COM4a.motor');
clc;

a.servoAttach(1);
a.servoStatus;
a.servoWrite(1,78); %Vertical position
%a.servoWrite(1,170); %Horizontal position

a.pinMode(14,'output');
a.pinMode(15,'output');
a.pinMode(6,'output');
a.pinMode(7,'output');
a.pinMode(8,'output');
a.pinMode(9,'output');
x=1;

        
giLED=7; %Green In LED
riLED=6; %Red In LED
goLED=9; %Green Out LED
roLED=8; %Red Out LED 
rLED=15; 
lLED=14;

approach=2;
departure=3;

i = 0; ii = 0;
a.motorRun(1,'forward');
tStart = tic;
while x == 1
    a.motorSpeed(1,255);
    
    b = a.analogRead(approach);
    
    if b >= 300
        i = i + 1;
        aVec(i) = a.analogRead(approach);
        if i>1 || mode(aVec) >= 300;
            aVec = 0;
            tS = toc(tStart);
            disp(tS);
        end
    end
    c = a.analogRead(departure);
    if c >= 300
        ii = ii + 1;
        dVec(i) = a.analogRead(departure);
        if i>1 || mode(dVec) >= 300;
            dVec = 0;
            tE = toc(tStart);
            disp(tE);
        end
    end
    
end