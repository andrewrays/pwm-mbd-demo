# HDL Implementation of Three-Channel PWM with Model-Based Design Approach

## Overview

The project was made for demonstration of capabilities of the Model-Based Design (MBD)
approach in simple FPGA projects development process.

The process consists of three main parts: system design, testing, and HDL code generation
with deployment.

For implementation of the task, algorithm of three-channel PWM generation was chosen.
The system also has algorithms for duty cycles setting and channel number selection with
the buttons and additional modules for pressing-of-the-button events processing.

All algorithms have requirement sets and simulation-based tests were developed and
executed in order to prove that all modules work fine.  

### Acknowledgments

The models are based on algorithms which were provided by Krivilyov A.V.,
D.Sc. (Technology), Full Professor at MAI.  

## Modules

One can divide the system in three major parts:
- Processing of pressing-of-the-button events,
- Duty cycles generation,
- PWM generation.

The first part includes the following algorithms:
- Button Digital Filter (for all buttons),
- Zero-Key Rollover Handler,
- Pressing Mode Handler.

The second and the third parts are represented by Data Generator module and
PWM Generator module, respectively. 

Also, the system has Frequency Divider module.

### IO

In system, five buttons are used:
- Up (increase the duty cycle),
- Down (decrease the duty cycle),
- Reset (set to zero duty cycles of all channels),
- Next (select the next channel),
- Previous (select the previous channel).

To observe PWM and synchronization signals, four digital outputs are used.

### Frequency Divider

### Button Digital Filter

### Zero-Key Rollover Handler

### Pressing Mode Handler

### Data Generator

### PWM Generator

## Simulation & Experiments

### Trailing edge modulation (back)

![](https://github.com/andrewrays/pwm-mbd-demo/blob/automate_tests/images/b_exp_sim.png)

### Leading edge modulation (front)

![](https://github.com/andrewrays/pwm-mbd-demo/blob/automate_tests/images/f_exp_sim.png)

### Centered pulses (centered)

![](https://github.com/andrewrays/pwm-mbd-demo/blob/automate_tests/images/c_exp_sim.png)
