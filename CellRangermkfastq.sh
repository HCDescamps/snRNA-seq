#!/bin/bash

# Thank you Wincent Wu for teaching me how to use HPC, shell, and creating my first bcl2fast and kallisto codes for bulk RNAseq, which this code is inspired from.

# Parameter

RUN_DIR="/home/descamps/10X_genomics/SingleNucleus/rawdata"
OUT_DIR="/home/descamps/10X_genomics/SingleNucleus/"

# Load module on HPC

module load bcl2fastq2/v2.20.0.422
 
# Start run

echo "Starting CellRanger mkfastq run"

nohup cellranger mkfastq --run=$RUN_DIR --id=TimeCourse --csv=/home/descamps/10X_genomics/SingleNucleus/SampleSheet.csv

echo "Done"