#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --exclude=compute-0-11

# Load Anaconda environment

input=$1
input_pdbs=($(cat "$input"))
pdb=${input_pdbs[$SLURM_ARRAY_TASK_ID]}

target_chain=$2
binder_chain=$3
out_file=$4
xml_file=$5

########################
# Binder optimization
########################
echo "Running binder analysis"

source ~/anaconda3/bin/activate colabthread-tsatler

python helper_scripts/binder_analysis.py $pdb $target_chain $binder_chain $out_file $xml_file