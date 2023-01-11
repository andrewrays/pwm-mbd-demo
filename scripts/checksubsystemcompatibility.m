function result = checksubsystemcompatibility(ModelName, Directory)
HarnessName = ModelName + "_harness";

load_system(ModelName);

sltest.harness.load(ModelName, HarnessName);

if ~exist(['..\pwm-mbd-demo\work\' Directory], 'dir')
    mkdir('..\pwm-mbd-demo\work\', Directory);
end

result = checkhdl(HarnessName + "/DUT", ...
     TargetDirectory = "..\pwm-mbd-demo\work\" + Directory);
end