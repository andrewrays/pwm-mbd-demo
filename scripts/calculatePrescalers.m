Data = extractdatafromdict();

%%
PRESCALER.FLTR = (1e9*Data.FLTR_PERIOD)/(1e9/Data.CLK_FREQ)/2;

%%
CNT_MAX = 2^Data.SIZE - 2;

if strcmp(Data.TYPE,'TYPE.CENTERED'), K = 2;
else,                                 K = 1;
end

PRESCALER.PWM = round((1e9/Data.PWM_FREQ)/(1e9/Data.CLK_FREQ)/(CNT_MAX+1)/K);

%%
clear Data CNT_MAX K