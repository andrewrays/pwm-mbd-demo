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

Two frequency dividers modules (models) are used in project. They provide operation of the button filters and the PWM generator. 

The module is based on the HDL Counter block from HDL Coder library and implements the up counter with maximum value $N-1$ where $N$ is a module of the counter.

Word length of data equals $\lceil \log_{2}(N) \rceil$.

### Button Digital Filter

### Zero-Key Rollover Handler

### Pressing Mode Handler

### Data Generator

### PWM Generator

## Data Dictionaries

The project contains six data dictionaries for each component:
- `filterDictionary.sldd` stores parameters of button filters;
- `pulsesgenDictionary.sldd` stores parameters of zero-key rollover handler;
- `datacounterDictionary.sldd` stores parameters of data generator;
- `pwmgenDictionary.sldd` stores parameters of PWM generator;
- `targetDictionary.sldd` stores parameters of FPGA;
- `mainDictionary.sldd` is a high-level dictionary.

The following parameters of the system are used (by default):
| Parameter   | Value        | Unit |
| ---------   | ------------ | ---- |
| SIZE        | 5            | -    |
| FLTR_PRD    | 0.001        | sec  |
| PAUSE_PRD   | 1            | sec  |
| REPEATS_PRD | 0.1          | sec  |
| TYPE        | Types of PWM | -    |
| PWM_FREQ    | 5e4          | Hz   |
| CLK_FREQ    | 2e8          | Hz   |

Variable TYPE is an enumeration type and has three values: FRONT, BACK, and CENTERED.

## Simulation & Experiments

In this section, you can see the results of experiments and comparison of experiments with simulation.

[Virtex-6 FPGA ML605 Evaluation Kit](https://www.xilinx.com/products/boards-and-kits/ek-v6-ml605-g.html) was chosen as a target for experiments.

Nine experiments were carried out:
- three with trailing edge modulation PWM;
- three with leading edge modulation PWM;
- three with centered pulses PWM.

Data from oscilloscope was transfered to MATLAB and processed there in order to realize appropriate comparison.

In the figures at right, simulation results are depicted:
- S - synch (yellow line);
- P1 - the first channel of PWM (green line);
- P2 - the second channel of PWM (blue line);
- P3 - the third channel of PWM (red line).

Black lines over them are experimental data of corresponding signal.

### Trailing edge modulation (back)

![](https://github.com/andrewrays/pwm-mbd-demo/blob/automate_tests/images/b_exp_sim.png)

### Leading edge modulation (front)

![](https://github.com/andrewrays/pwm-mbd-demo/blob/automate_tests/images/f_exp_sim.png)

### Centered pulses (centered)

![](https://github.com/andrewrays/pwm-mbd-demo/blob/automate_tests/images/c_exp_sim.png)
