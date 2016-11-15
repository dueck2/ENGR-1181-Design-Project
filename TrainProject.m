%11/9/2016 - Version .1
%Task 1
clear; clc; close; delete(instrfindall);
a = arduino('COM3');
clc;
%Task 2
%Servo on port 1
a.servoAttach(1);
a.servoStatus;
a.servoWrite(1,78); %Vertical position
a.servoWrite(1,170); %Horizontal position

%Task 3
clc;
a.pinMode(14,'output');
a.pinMode(15,'output');
a.pinMode(6,'output');
a.pinMode(7,'output');
a.pinMode(8,'output');
a.pinMode(9,'output');
a.digitalRead(15);
a.digitalWrite(15,1); %Left RR Light
a.digitalWrite(14,1); %Right RR Light
rLED=15; lLED=14; %RR Crossing LED
a.digitalWrite(rLED,1);
a.digitalWrite(lLED,1);
giLED=7; %Green In LED
riLED=6; %Red In LED
goLED=9; %Green Out LED
roLED=8; %Red Out LED 
a.digitalWrite(giLED,1);
a.digitalWrite(riLED,1);
a.digitalWrite(goLED,1);
a.digitalWrite(roLED,1);

a.motorRun(1,'forward');
a.motorSpeed(1,255); %Range of 170 - 255

%% Task 5

approach=2;
departure=3;

a.analogRead(approach);

%% Task 6
tStart = tic;
timeElapsed = toc(tStart);
fprintf('The time elasped is: %7.5f sec \n', timeElapsed);
ntElapsed = toc(tStart);
fprintf('The new time elasped is: %7.5f sec \n', ntElapsed);

