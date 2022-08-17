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
figure(Color = [1 1 1], Position = [100 100 800 503], ...
    PaperPositionMode = 'auto')

hold on
plot(Time, Synch + 12.5, Color = "yellow", LineWidth = 1);
plot(Time, PWM1 + 5, Color = "green", LineWidth = 1);
plot(Time, PWM2 - 5, Color = "blue", LineWidth = 1);
plot(Time, PWM3 - 15, Color = "magenta", LineWidth = 1);
hold off

text(Time(1) - 0.3e-5, 12.5, '$$S$$', ...
    Interpreter = 'latex', FontSize = 12);
text(Time(1) - 1.6e-5, 5, '$$P_{1}\;(\gamma = 0.25)$$', ...
    Interpreter = 'latex', FontSize = 12);
text(Time(1) - 1.6e-5, -5, '$$P_{2}\;(\gamma = 0.5)$$', ...
    Interpreter = 'latex', FontSize = 12);
text(Time(1) - 1.6e-5, -15, '$$P_{3}\;(\gamma = 0.75)$$', ...
    Interpreter = 'latex', FontSize = 12);

ax = gca;
% ax.InnerPosition = [0 0 800 503];
box on
ax.FontSize = 12;
ax.TickLabelInterpreter = 'latex';
ax.XLim = [-5 5].*1e-5;
ax.YLim = [-20 20];

ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XTick = (-5:5)*1e-5;
ax.XTickLabel = 0:11;
ax.YTickLabel = [];

% image size = 800x503 pixels

%%
print 'f_25_50_75_m' '-dpng' '-r300'