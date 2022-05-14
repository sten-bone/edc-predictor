# edc-predictor

## Data
All the main data for the project can be found in [this Excel document](https://github.com/sten-bone/edc-predictor/blob/main/EDC%20Benchmarks.xlsx). This also includes the input values used for each program.

## Measuring EDC
Each benchmark has its own measure.py defined which collects the correct EDC information. The measure.py file should be at the same level as the llfi directory. From the directory containing both the llfi directory and the measure.py script, simply run ```python3 measure.py``` to automatically collect the measurement data. The results will be saved to llfi/results.txt.

## Measuring Dynamic Instructions
The process of creating the dynamic instruction pass is handled by [create_di_count.sh](https://github.com/sten-bone/edc-predictor/blob/main/benchmarks/create_di_count.sh). From the directory containing the llfi directory, run ```bash create_di_count.sh <benchmark>```, where "benchmark" matches the name used in the LLFI fault injections. This will generate a file di_count.ll for the benchmark, which can then be run with ```lli di_count.ll <inputs>```. The dynamic instructions counts will be exported to dynamic-instruction-count.txt.

## Calculating EDC Rank
EDC rank calculation is handled by [edc_ranked_di_count.py](https://github.com/sten-bone/edc-predictor/blob/main/edc_ranked_di_count.py). To use it, a raw EDC rank needs to be generated for instructions whose rank will not default to 1. Once that is created with the format ```<instruction>: <outerLoop> <innerLoop> <domLoop> <dataWithin>``` for each instruction, run the script with ```python3 edc_ranked_di_count.py <di_count_file> <raw_edc_file> <output_file>```. This will generate the weighted EDC ranked dynamic instruction count, listed at the top of the output file.
  
## Running Linear Regression
The linear regression is located in [regression.py](https://github.com/sten-bone/edc-predictor/blob/main/regression.py). To run it, just use ```python3 regression.py```, since data values are hardcoded.
