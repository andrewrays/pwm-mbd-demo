Data = extractdatafromdict();

%%
PRESCALER.FLTR = (1e9*Data.FLTR_PERIOD)/(1e9/Data.CLK_FREQ)/2;

%%
CNT_MAX = 2^Data.SIZE - 2;

switch bdroot
    case 'pwm_generator_harness'
        Data.TYPE = get_param('pwm_generator_harness/DUT/counters/PWM_TYPE', 'Value');
    case 'main_model_harness'
        Data.TYPE = get_param('main_model_harness/DUT/pwm_generator/counters/PWM_TYPE', 'Value');
    otherwise
        Data.TYPE = 'TYPE.CENTERED';
end

if strcmp(Data.TYPE,'TYPE.CENTERED'), K = 2;
else,                                 K = 1;
end

PRESCALER.PWM = round((1e9/Data.PWM_FREQ)/(1e9/Data.CLK_FREQ)/(CNT_MAX+1)/K);

%%
clear CNT_MAX K
