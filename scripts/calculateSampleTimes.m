Data = extractdatafromdict();

%%
PRESCALER.FLTR = (1e9*Data.FLTR_PERIOD)/(1e9/Data.CLK_FREQ)/2; 

SampleTime.FLTR = roundsampletime(PRESCALER.FLTR/Data.CLK_FREQ, Data.CLK_FREQ);

%%
CNT_MAX = 2^Data.SIZE - 2;

if strcmp(Data.TYPE,'TYPE.CENTERED'), K = 2;
else,                                 K = 1;
end


PRESCALER.PWM = (1e9/Data.PWM_FREQ)/(1e9/Data.CLK_FREQ)/(CNT_MAX+1)/K;

SampleTime.PWM = roundsampletime(PRESCALER.PWM/Data.CLK_FREQ, Data.CLK_FREQ);

%%
clear Data CNT_MAX K PRESCALER