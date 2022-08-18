%% 
opts = delimitedTextImportOptions("NumVariables", 5);
opts.DataLines = [3, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["xaxis", "VarName2", "VarName3", "VarName4", "VarName5"];
opts.VariableTypes = ["double", "double", "double", "double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
f255075t = table2array(readtable("f_25_50_75_t.csv", opts));

%%
Time = f255075t(:,1);
Synch = f255075t(:,2);
PWM1 = f255075t(:,3);
PWM2 = f255075t(:,4);
PWM3 = f255075t(:,5);

%%
load f_25_50_75_sim.mat

SynchSim = simOut{1}.Values;
PWM1Sim  = simOut{2}.Values;
PWM2Sim  = simOut{3}.Values;
PWM3Sim  = simOut{4}.Values;

%%
figure(Color = [1 1 1], Units = "centimeters", Position = [10 10 15 9], ...
    PaperPositionMode = 'auto')

hold on
plot(Time, Synch + 12.85, Color = "yellow", LineWidth = 3);
plot(Time, PWM1 + 5.22, Color = "green", LineWidth = 3);
plot(Time, PWM2 - 5, Color = "cyan", LineWidth = 3);
plot(Time, PWM3 - 15, Color = "red", LineWidth = 3);

plot(SynchSim.Time - 8.06e-5, 5*SynchSim.Data + 12.5, ...
    LineWidth = 1.3, Color = "black")
plot(PWM1Sim.Time - 8.06e-5, 5*PWM1Sim.Data + 5, ...
    LineWidth = 1.3, Color = "black")
plot(PWM2Sim.Time - 8.06e-5, 5*PWM2Sim.Data - 5, ...
    LineWidth = 1.3, Color = "black")
plot(PWM3Sim.Time - 8.06e-5, 5*PWM3Sim.Data - 15, ...
    LineWidth = 1.3, Color = "black")
hold off

text(Time(end) + 0.1e-5, 12.5, '$$S$$', ...
    Interpreter = 'latex', FontSize = 12);
text(Time(end) + 0.1e-5, 5, '$$P_{1}$$', ...
    Interpreter = 'latex', FontSize = 12);
text(Time(end) + 0.1e-5, -5, '$$P_{2}$$', ...
    Interpreter = 'latex', FontSize = 12);
text(Time(end) + 0.1e-5, -15, '$$P_{3}$$', ...
    Interpreter = 'latex', FontSize = 12);

text(Time(end) + 0.1e-5, 5 + 2.5, '$$\gamma = 0.25$$', ...
    Interpreter = 'latex', FontSize = 12);
text(Time(end) + 0.1e-5, -5 + 2.5, '$$\gamma = 0.5$$', ...
    Interpreter = 'latex', FontSize = 12);
text(Time(end) + 0.1e-5, -15 + 2.5, '$$\gamma = 0.75$$', ...
    Interpreter = 'latex', FontSize = 12);

text(Time(end) + 0.4e-5, -22.1, 'Time ($$\mu$$s)', ...
    Interpreter = 'latex', FontSize = 12);

ax = gca;
ax.Units = "centimeters";
ax.InnerPosition = [0.3 1 12 7.52];
box on
ax.FontSize = 12;
ax.TickLabelInterpreter = 'latex';
ax.XLim = [-5 5].*1e-5;
ax.YLim = [-20 20];

ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XTick = (-5:5)*1e-5;
ax.XTickLabel = 0:10:100;
ax.YTickLabel = [];

% image size = 800x503 pixels

print '..\pwm-mbd-demo\data\simulation\f_25_50_75_m' '-dpng' '-r300'