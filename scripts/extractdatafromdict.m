function Data = extractdatafromdict()
dictionaryObj = Simulink.data.dictionary.open('mainDictionary.sldd');

dataSectionObj = getSection(dictionaryObj,'Design Data');

Data.CLK_FREQ    = getValue(getEntry(dataSectionObj,'CLK_FREQ')).Value;
Data.FLTR_PERIOD = getValue(getEntry(dataSectionObj,'FLTR_PERIOD')).Value;
Data.PAUSE_PRD   = getValue(getEntry(dataSectionObj,'PAUSE_PRD')).Value;
Data.REPEATS_PRD = getValue(getEntry(dataSectionObj,'REPEATS_PRD')).Value;
Data.SIZE        = getValue(getEntry(dataSectionObj,'SIZE')).Value;
Data.PWM_FREQ    = getValue(getEntry(dataSectionObj,'PWM_FREQ')).Value;
Data.TYPE        = get_param('pwm_generator/counters/PWM_TYPE', 'Value');

end