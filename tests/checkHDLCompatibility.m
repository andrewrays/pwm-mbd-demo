compatibilityResult.frequencyDivider = checksubsystemcompatibility('frequency_divider', 'hdl_frq_div');
compatibilityResult.filter           = checksubsystemcompatibility('button_filter', 'hdl_filter');
compatibilityResult.rolloverHandler  = checksubsystemcompatibility('rollover_handler', 'hdl_planner');
compatibilityResult.pulseGenerator   = checksubsystemcompatibility('control_pulses_generator', 'hdl_cpg');
compatibilityResult.dataCounter      = checksubsystemcompatibility('data_counter', 'hdl_data_counter');
compatibilityResult.pwmGenerator     = checksubsystemcompatibility('pwm_generator', 'hdl_pwm_gen');
compatibilityResult.mainModel        = checksubsystemcompatibility('main_model', 'hdl_main');