#!/bin/bash
#SBATCH --nodes=20
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=20
#SBATCH --cpus-per-task=2
#SBATCH --partition=nvidia_small
#SBATCH --job-name=2000bs-2th-aminoacido
#SBATCH --time=01:00:00
#SBATCH --exclusive

module load raxml/8.2_openmpi-2.0_gnu

cd $SLURM_SUBMIT_DIR

ulimit -s unlimited
ulimit -c unlimited
ulimit -v unlimited

EXEC="raxmlHPC-HYBRID-AVX"
BOOTSTRAP=2000
INPUT=/RAXML/inputs/aminoacido.phylip
PREFIX=`basename -s .phylip ${INPUT}`
PARAM="-T $SLURM_CPUS_PER_TASK -m PROTGAMMAWAG -p 112233 -s ${INPUT} -b 223344 -N $BOOTSTRAP -n ${PREFIX}-hybrid-${SLURM_CPUS_PER_TASK}th-${SLURM_NTASKS}n-${BOOTSTRAP}bs-rep${1}.phylip_tree2.raxml -c 4 -f d"

echo $INPUT

time srun -n $SLURM_NTASKS -c $SLURM_CPUS_PER_TASK $EXEC $PARAM
