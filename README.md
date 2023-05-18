# RiscV-Processor
This projects uses Verilog to implement RiscV modules for various processor components such as Program Counter, Instruction Memory, Data Memory, ALU, Muxes, etc.

## Further details
All the modules files and their testbenches are present in the repository. To locate a testbench, look for the module name followed by a <code>tb</code> (test bench).

The datapath followed is given below:
![Screenshot 2023-05-18 213335](https://github.com/AbdullahHabib-github/RiscV-Processor/assets/91840456/cf3b22ac-ee87-4577-ba57-d0f555e909a3)
Desclaimer! The above mentioned Datapath is taken from Computer Organization and Design: THE HARDWARE SOFTWARE INTERFACE (David A. Patterson & John L. Hennessy)

## Installation
The Verilog Code was written using Vs Code. To use verilog on Vs Code follow this [video](https://www.youtube.com/watch?v=vN1wzM0NO4c).

## How To Run
* Once you are done with the installation process, navigate to the <code>Code</code> folder and open in teminal.
* To run the whole processor follow the following commands in the terminal:
<code>iverilog -o processor_tb.vvp processor_tb.v</code> followed by
<code>vvp processor_tb.vvp</code> and then <code>gtkwave</code> .
* This would create a visual demonstration on a waveform.
* To check each module seperately, you can use the same commands for their respective testbenches.
* For example, if you want to test <code>adder.v</code> file, follow the following commands on terminal: <code>iverilog -o adder_tb.vvp adder_tb.v</code> followed by
<code>vvp adder_tb.vvp</code> and then <code>gtkwave</code> .
