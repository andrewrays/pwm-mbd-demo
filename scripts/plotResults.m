%%
Experiment = ["f_25_50_75_t", "f_50_75_25_t", "f_75_25_50_t"; 
              "b_25_50_75_t", "b_50_75_25_t", "b_75_25_50_t";
              "c_25_50_75_t", "c_50_75_25_t", "c_75_25_50_t"];

f255075t = importexpdata(Experiment(1,1));
f507525t = importexpdata(Experiment(1,2));
f752550t = importexpdata(Experiment(1,3));

b255075t = importexpdata(Experiment(2,1));
b507525t = importexpdata(Experiment(2,2));
b752550t = importexpdata(Experiment(2,3));

c255075t = importexpdata(Experiment(3,1));
c507525t = importexpdata(Experiment(3,2));
c752550t = importexpdata(Experiment(3,3));

%%
Time(:,1)  = f255075t(:,1);

% Front
Synch(:,1) = f255075t(:,2); 
PWM1(:,1)  = f255075t(:,3); 
PWM2(:,1)  = f255075t(:,4);
PWM3(:,1)  = f255075t(:,5);

Synch(:,2) = f507525t(:,2);
PWM1(:,2)  = f507525t(:,3);
PWM2(:,2)  = f507525t(:,4);
PWM3(:,2)  = f507525t(:,5);

Synch(:,3) = f752550t(:,2);
PWM1(:,3)  = f752550t(:,3);
PWM2(:,3)  = f752550t(:,4);
PWM3(:,3)  = f752550t(:,5);

% Back
Synch(:,4) = b255075t(:,2); 
PWM1(:,4)  = b255075t(:,3); 
PWM2(:,4)  = b255075t(:,4);
PWM3(:,4)  = b255075t(:,5);

Synch(:,5) = b507525t(:,2);
PWM1(:,5)  = b507525t(:,3);
PWM2(:,5)  = b507525t(:,4);
PWM3(:,5)  = b507525t(:,5);

Synch(:,6) = b752550t(:,2);
PWM1(:,6)  = b752550t(:,3);
PWM2(:,6)  = b752550t(:,4);
PWM3(:,6)  = b752550t(:,5);

% Centered
Synch(:,7) = c255075t(:,2); 
PWM1(:,7)  = c255075t(:,3); 
PWM2(:,7)  = c255075t(:,4);
PWM3(:,7)  = c255075t(:,5);

Synch(:,8) = c507525t(:,2);
PWM1(:,8)  = c507525t(:,3);
PWM2(:,8)  = c507525t(:,4);
PWM3(:,8)  = c507525t(:,5);

Synch(:,9) = c752550t(:,2);
PWM1(:,9)  = c752550t(:,3);
PWM2(:,9)  = c752550t(:,4);
PWM3(:,9)  = c752550t(:,5);

%%
dutyCyclesDecimal = [8 15 23];

simOut = cell(3,3);

t = [0; 0.0002];

for j = 1:3
    switch j
        case 1
            set_param('pwm_generator_harness/DUT/counters/PWM_TYPE', ...
                    Value = 'TYPE.FRONT');
        case 2
            set_param('pwm_generator_harness/DUT/counters/PWM_TYPE', ...
                    Value = 'TYPE.BACK');
        case 3
            set_param('pwm_generator_harness/DUT/counters/PWM_TYPE', ...
                    Value = 'TYPE.CENTERED');
    end

    for i = 1:3
        switch i
            case 1
                dc1 = timeseries(repmat(dutyCyclesDecimal(1),2,1), t);
                dc2 = timeseries(repmat(dutyCyclesDecimal(2),2,1), t);
                dc3 = timeseries(repmat(dutyCyclesDecimal(3),2,1), t);
            case 2
                dc1 = timeseries(repmat(dutyCyclesDecimal(2),2,1), t);
                dc2 = timeseries(repmat(dutyCyclesDecimal(3),2,1), t);
                dc3 = timeseries(repmat(dutyCyclesDecimal(1),2,1), t);
            case 3
                dc1 = timeseries(repmat(dutyCyclesDecimal(3),2,1), t);
                dc2 = timeseries(repmat(dutyCyclesDecimal(1),2,1), t);
                dc3 = timeseries(repmat(dutyCyclesDecimal(2),2,1), t);
        end

        simOut{j,i} = sim('pwm_generator_harness');
    end
end
%%

fSynchSim = false(40001,3);
fPWM1Sim  = false(40001,3);
fPWM2Sim  = false(40001,3);
fPWM3Sim  = false(40001,3);

bSynchSim = false(40001,3);
bPWM1Sim  = false(40001,3);
bPWM2Sim  = false(40001,3);
bPWM3Sim  = false(40001,3);

cSynchSim = false(40001,3);
cPWM1Sim  = false(40001,3);
cPWM2Sim  = false(40001,3);
cPWM3Sim  = false(40001,3);

for k = 1:3
    fSynchSim(:,k) = simOut{1,k}.logsout{1}.Values.Data;
    fPWM1Sim(:,k)  = simOut{1,k}.logsout{2}.Values.Data;
    fPWM2Sim(:,k)  = simOut{1,k}.logsout{3}.Values.Data;
    fPWM3Sim(:,k)  = simOut{1,k}.logsout{4}.Values.Data;

    bSynchSim(:,k) = simOut{2,k}.logsout{1}.Values.Data;
    bPWM1Sim(:,k)  = simOut{2,k}.logsout{2}.Values.Data;
    bPWM2Sim(:,k)  = simOut{2,k}.logsout{3}.Values.Data;
    bPWM3Sim(:,k)  = simOut{2,k}.logsout{4}.Values.Data;

    cSynchSim(:,k) = simOut{3,k}.logsout{1}.Values.Data;
    cPWM1Sim(:,k)  = simOut{3,k}.logsout{2}.Values.Data;
    cPWM2Sim(:,k)  = simOut{3,k}.logsout{3}.Values.Data;
    cPWM3Sim(:,k)  = simOut{3,k}.logsout{4}.Values.Data;
end


TimeSim = simOut{1,1}.logsout{1}.Values.Time;

%%
imageNames = {'f_25_50_75_m', 'f_50_75_25_m', 'f_75_25_50_m';
              'b_25_50_75_m', 'b_50_75_25_m', 'b_75_25_50_m';
              'c_25_50_75_m', 'c_50_75_25_m', 'c_75_25_50_m'};

for i = 1:3
    customplot(Experiment(1,i), Time, Synch(:,i), PWM1(:,i), PWM2(:,i), PWM3(:,i), ...
        TimeSim, fSynchSim(:,i), fPWM1Sim(:,i), fPWM2Sim(:,i), fPWM3Sim(:,i));

    printimage(imageNames{1,i});
end

for i = 1:3
    customplot(Experiment(2,i), Time, ...
        Synch(:,i+3), PWM1(:,i+3), PWM2(:,i+3), PWM3(:,i+3), ...
        TimeSim, bSynchSim(:,i), bPWM1Sim(:,i), bPWM2Sim(:,i), bPWM3Sim(:,i));

    printimage(imageNames{2,i});
end

for i = 1:3
    customplot(Experiment(3,i), Time, ...
        Synch(:,i+6), PWM1(:,i+6), PWM2(:,i+6), PWM3(:,i+6), ...
        TimeSim, cSynchSim(:,i), cPWM1Sim(:,i), cPWM2Sim(:,i), cPWM3Sim(:,i));

    printimage(imageNames{3,i});
end

%%
clear