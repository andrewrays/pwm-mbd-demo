function customplot(Experiment, Time, Synch, PWM1, PWM2, PWM3, ...
                    TimeSim, SynchSim, PWM1Sim, PWM2Sim, PWM3Sim)

Info = extractexperimentinfo(Experiment);

figure(Color = [1 1 1], Units = "centimeters", Position = [10 10 15 9], ...
    PaperPositionMode = 'auto')

hold on
plot(Time, Synch + 12.85, Color = [0.9 0.9 0.3], LineWidth = 2);
plot(Time, PWM1 + 5.22, Color = "green", LineWidth = 2);
plot(Time, PWM2 - 5, Color = "cyan", LineWidth = 2);
plot(Time, PWM3 - 15, Color = "red", LineWidth = 2);

switch Info.PWMType
    case {'Front', 'Back'}
        plot(TimeSim - 8.06e-5, 5*SynchSim + 12.5, ...
            LineWidth = 1.3, Color = "black")
        plot(TimeSim - 8.06e-5, 5*PWM1Sim + 5, ...
            LineWidth = 1.3, Color = "black")
        plot(TimeSim - 8.06e-5, 5*PWM2Sim - 5, ...
            LineWidth = 1.3, Color = "black")
        plot(TimeSim - 8.06e-5, 5*PWM3Sim - 15, ...
            LineWidth = 1.3, Color = "black")
    case 'Centered'
        plot(TimeSim - 8.09e-5, 5*SynchSim + 12.5, ...
            LineWidth = 1.3, Color = "black")
        plot(TimeSim - 8.09e-5, 5*PWM1Sim + 5, ...
            LineWidth = 1.3, Color = "black")
        plot(TimeSim - 8.09e-5, 5*PWM2Sim - 5, ...
            LineWidth = 1.3, Color = "black")
        plot(TimeSim - 8.09e-5, 5*PWM3Sim - 15, ...
            LineWidth = 1.3, Color = "black")
end

hold off

text(Time(end) + 0.1e-5, 12.5, '$$S$$', ...
    Interpreter = 'latex', FontSize = 12);
text(Time(end) + 0.1e-5, 5, '$$P_{1}$$', ...
    Interpreter = 'latex', FontSize = 12);
text(Time(end) + 0.1e-5, -5, '$$P_{2}$$', ...
    Interpreter = 'latex', FontSize = 12);
text(Time(end) + 0.1e-5, -15, '$$P_{3}$$', ...
    Interpreter = 'latex', FontSize = 12);

text(Time(end) + 0.1e-5, 5 + 2.7, ['$$\gamma = ' num2str(Info.dc1) '$$'], ...
    Interpreter = 'latex', FontSize = 12);
text(Time(end) + 0.1e-5, -5 + 2.7, ['$$\gamma = ' num2str(Info.dc2) '$$'], ...
    Interpreter = 'latex', FontSize = 12);
text(Time(end) + 0.1e-5, -15 + 2.7, ['$$\gamma = ' num2str(Info.dc3) '$$'], ...
    Interpreter = 'latex', FontSize = 12);

text(Time(end) + 0.4e-5, -22.1, 'Time ($$\mu$$s)', ...
    Interpreter = 'latex', FontSize = 12);

text(Time(end) + 0.2e-5, 20, Info.PWMType, ...
    Interpreter = 'latex', FontSize = 12)

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
end

function Info = extractexperimentinfo(String)
switch String{1}(1)
    case 'f', Info.PWMType = "Front";
    case 'b', Info.PWMType = "Back";
    case 'c', Info.PWMType = "Centered"; 
end

switch String{1}(3:4)
    case '25', Info.dc1 = 0.25;
    case '50', Info.dc1 = 0.5;
    case '75', Info.dc1 = 0.75;
end

switch String{1}(6:7)
    case '25', Info.dc2 = 0.25;
    case '50', Info.dc2 = 0.5;
    case '75', Info.dc2 = 0.75;
end

switch String{1}(9:10)
    case '25', Info.dc3 = 0.25;
    case '50', Info.dc3 = 0.5;
    case '75', Info.dc3 = 0.75;
end
end