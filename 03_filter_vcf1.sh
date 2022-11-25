#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=filter1
#SBATCH --nodes=1 --ntasks=1
#SBATCH --partition quanah
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-45

# define input files from helper file during genotyping
input_array=$( head -n${SLURM_ARRAY_TASK_ID} vcf_list.txt | tail -n1 )

# define main working directory
workdir=/lustre/scratch/jmanthey/12_relatedness

# run vcftools with SNP output spaced 50kbp 
vcftools --vcf ${workdir}/03_vcf/${input_array}.g.vcf --max-missing 0.3 --minGQ 20 --minDP 8 --max-meanDP 50 --min-alleles 2 --max-alleles 2 --mac 1 --max-maf 0.49 --remove-indels --recode --recode-INFO-all --out ${workdir}/03_vcf/${input_array}
