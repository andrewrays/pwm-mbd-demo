%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 9.12 (R2022a) at 23:23:13 on 19/08/2022
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\andre\Documents\GitHub\pwm-mbd-demo\scripts\hdlworkflow.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'main_model_harness/DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','main_model_harness/DUT');
%--------------------------------------------------------------------------

%% Load the Model
load_system('main_model_harness');

%%
mkdir('..\pwm-mbd-demo\work\hdl_main', 'prj');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('main_model_harness/DUT');

%% Model HDL Parameters
%% Set Model 'main_model_harness' HDL parameters
hdlset_param('main_model_harness', 'HDLCodingStandard', 'Industry');
hdlset_param('main_model_harness', 'HDLSubsystem', 'main_model_harness/DUT');
hdlset_param('main_model_harness', 'MinimizeClockEnables', 'on');
hdlset_param('main_model_harness', 'ResetType', 'Synchronous');
hdlset_param('main_model_harness', 'ScalarizePorts', 'DUTLevel');
hdlset_param('main_model_harness', 'SynthesisTool', 'Xilinx ISE');
hdlset_param('main_model_harness', 'SynthesisToolChipFamily', 'Virtex6');
hdlset_param('main_model_harness', 'SynthesisToolDeviceName', 'xc6vlx240t');
hdlset_param('main_model_harness', 'SynthesisToolPackageName', 'ff1156');
hdlset_param('main_model_harness', 'SynthesisToolSpeedValue', '-1');
hdlset_param('main_model_harness', 'TargetDirectory', 'C:\Users\andre\Documents\GitHub\pwm-mbd-demo\work\hdl_main\prj\hdlsrc');
hdlset_param('main_model_harness', 'TargetFrequency', 200);
hdlset_param('main_model_harness', 'TargetPlatform', 'Xilinx Virtex-6 ML605 development board');
hdlset_param('main_model_harness', 'Workflow', 'FPGA Turnkey');

% Set Inport HDL parameters
hdlset_param('main_model_harness/DUT/button_up', 'IOInterface', 'User Push Buttons N-E-S-W-C [0:4]');
hdlset_param('main_model_harness/DUT/button_up', 'IOInterfaceMapping', '[4]');

% Set Inport HDL parameters
hdlset_param('main_model_harness/DUT/button_down', 'IOInterface', 'User Push Buttons N-E-S-W-C [0:4]');
hdlset_param('main_model_harness/DUT/button_down', 'IOInterfaceMapping', '[2]');

% Set Inport HDL parameters
hdlset_param('main_model_harness/DUT/button_reset', 'IOInterface', 'User Push Buttons N-E-S-W-C [0:4]');
hdlset_param('main_model_harness/DUT/button_reset', 'IOInterfaceMapping', '[0]');

% Set Inport HDL parameters
hdlset_param('main_model_harness/DUT/button_next', 'IOInterface', 'User Push Buttons N-E-S-W-C [0:4]');
hdlset_param('main_model_harness/DUT/button_next', 'IOInterfaceMapping', '[3]');

% Set Inport HDL parameters
hdlset_param('main_model_harness/DUT/button_previous', 'IOInterface', 'User Push Buttons N-E-S-W-C [0:4]');
hdlset_param('main_model_harness/DUT/button_previous', 'IOInterfaceMapping', '[1]');

% Set Inport HDL parameters
hdlset_param('main_model_harness/DUT/button_down_filter/button', 'IOInterface', 'User Push Buttons N-E-S-W-C [0:4]');
hdlset_param('main_model_harness/DUT/button_down_filter/button', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('main_model_harness/DUT/button_down_filter/filt_button', 'IOInterface', 'LCD Data Bits DB [0:3]');
hdlset_param('main_model_harness/DUT/button_down_filter/filt_button', 'IOInterfaceMapping', '[3]');

% Set Inport HDL parameters
hdlset_param('main_model_harness/DUT/button_next_filter/button', 'IOInterface', 'User Push Buttons N-E-S-W-C [0:4]');
hdlset_param('main_model_harness/DUT/button_next_filter/button', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('main_model_harness/DUT/button_next_filter/filt_button', 'IOInterface', 'LCD Data Bits DB [0:3]');
hdlset_param('main_model_harness/DUT/button_next_filter/filt_button', 'IOInterfaceMapping', '[3]');

% Set Inport HDL parameters
hdlset_param('main_model_harness/DUT/button_previous_filter/button', 'IOInterface', 'User Push Buttons N-E-S-W-C [0:4]');
hdlset_param('main_model_harness/DUT/button_previous_filter/button', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('main_model_harness/DUT/button_previous_filter/filt_button', 'IOInterface', 'LCD Data Bits DB [0:3]');
hdlset_param('main_model_harness/DUT/button_previous_filter/filt_button', 'IOInterfaceMapping', '[3]');

% Set Inport HDL parameters
hdlset_param('main_model_harness/DUT/button_reset_filter/button', 'IOInterface', 'User Push Buttons N-E-S-W-C [0:4]');
hdlset_param('main_model_harness/DUT/button_reset_filter/button', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('main_model_harness/DUT/button_reset_filter/filt_button', 'IOInterface', 'LCD Data Bits DB [0:3]');
hdlset_param('main_model_harness/DUT/button_reset_filter/filt_button', 'IOInterfaceMapping', '[3]');

% Set Inport HDL parameters
hdlset_param('main_model_harness/DUT/button_up_filter/button', 'IOInterface', 'User Push Buttons N-E-S-W-C [0:4]');
hdlset_param('main_model_harness/DUT/button_up_filter/button', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('main_model_harness/DUT/button_up_filter/filt_button', 'IOInterface', 'LCD Data Bits DB [0:3]');
hdlset_param('main_model_harness/DUT/button_up_filter/filt_button', 'IOInterfaceMapping', '[3]');

% Set Outport HDL parameters
hdlset_param('main_model_harness/DUT/pwm', 'IOInterface', 'LCD Data Bits DB [0:3]');
hdlset_param('main_model_harness/DUT/pwm', 'IOInterfaceMapping', '[0:2]');

% Set Outport HDL parameters
hdlset_param('main_model_harness/DUT/synch', 'IOInterface', 'LCD Data Bits DB [0:3]');
hdlset_param('main_model_harness/DUT/synch', 'IOInterfaceMapping', '[3]');

% Set Outport HDL parameters
hdlset_param('main_model_harness/DUT/leds', 'IOInterface', 'LEDs General Purpose [0:7]');
hdlset_param('main_model_harness/DUT/leds', 'IOInterfaceMapping', '[0:2]');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx ISE','TargetWorkflow','FPGA Turnkey');

% Specify the top level project directory
hWC.ProjectFolder = 'C:\Users\andre\Documents\GitHub\pwm-mbd-demo\work\hdl_main\prj';

% Set Workflow tasks to run
hWC.RunTaskGenerateRTLCode = true;
hWC.RunTaskCreateProject = true;
hWC.RunTaskPerformLogicSynthesis = true;
hWC.RunTaskPerformMapping = true;
hWC.RunTaskPerformPlaceAndRoute = true;
hWC.RunTaskGenerateProgrammingFile = true;
hWC.RunTaskProgramTargetDevice = true;

% Set properties related to 'RunTaskCreateProject' Task
hWC.Objective = hdlcoder.Objective.None;
hWC.AdditionalProjectCreationTclFiles = '';

% Set properties related to 'RunTaskPerformMapping' Task
hWC.SkipPreRouteTimingAnalysis = true;

% Set properties related to 'RunTaskPerformPlaceAndRoute' Task
hWC.IgnorePlaceAndRouteErrors = false;

% Validate the Workflow Configuration Object
hWC.validate;

%% Run the workflow
hdlcoder.runWorkflow('main_model_harness/DUT', hWC, ...
    'Verbosity', 'on');
