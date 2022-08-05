function appropriateSampleTime = roundsampletime(rawSampleTime, CLK_FREQ)
rawSampleTimeExponent = floor(log10(rawSampleTime));

tempSampleTime = rawSampleTime*10^(-rawSampleTimeExponent);

appropriateSampleTime = round(tempSampleTime,3)*10^(rawSampleTimeExponent);

if rem(appropriateSampleTime, 1/CLK_FREQ) ~= 0
    appropriateSampleTime = round(tempSampleTime,2)*10^(rawSampleTimeExponent);
end

end