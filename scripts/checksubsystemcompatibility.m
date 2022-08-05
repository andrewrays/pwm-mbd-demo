function result = checksubsystemcompatibility(ModelName, Directory)
HarnessName = ModelName + "_harness";

load_system(ModelName);

sltest.harness.load(ModelName, HarnessName);

result = checkhdl(HarnessName + "/DUT", ...
     TargetDirectory = "C:\Users\andre\Documents\GitHub\pwm-mbd-demo\work\" + Directory);
end