#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=filter2
#SBATCH --nodes=1 --ntasks=1
#SBATCH --partition quanah
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G

# define main working directory
workdir=/lustre/scratch/jmanthey/12_relatedness

# run vcftools with SNP output spaced 100kbp for herculeanus
vcftools --vcf ${workdir}/03_vcf/relatedness.all.vcf --keep herculeanus.txt --max-missing 1.0 --minDP 8 --max-meanDP 50 --min-alleles 2 --max-alleles 2 --mac 1 --thin 100000 --max-maf 0.49 --recode --recode-INFO-all --out ${workdir}/04_filtered_vcf_100kbp/herculeanus_100kbp

# run vcftools with SNP output spaced 50kbp for herculeanus
vcftools --vcf ${workdir}/03_vcf/relatedness.all.vcf --keep herculeanus.txt --max-missing 1.0 --minDP 8 --max-meanDP 50 --min-alleles 2 --max-alleles 2 --mac 1 --thin 50000 --max-maf 0.49 --recode --recode-INFO-all --out ${workdir}/05_filtered_vcf_50kbp/herculeanus_50kbp

# run vcftools with SNP output spaced 100kbp for laevissimus
vcftools --vcf ${workdir}/03_vcf/relatedness.all.vcf --keep laevissimus.txt --max-missing 1.0 --minDP 8 --max-meanDP 50 --min-alleles 2 --max-alleles 2 --mac 1 --thin 100000 --max-maf 0.49 --recode --recode-INFO-all --out ${workdir}/04_filtered_vcf_100kbp/laevissimus_100kbp

# run vcftools with SNP output spaced 50kbp for laevissimus
vcftools --vcf ${workdir}/03_vcf/relatedness.all.vcf --keep laevissimus.txt --max-missing 1.0 --minDP 8 --max-meanDP 50 --min-alleles 2 --max-alleles 2 --mac 1 --thin 50000 --max-maf 0.49 --recode --recode-INFO-all --out ${workdir}/05_filtered_vcf_50kbp/laevissimus_50kbp

# run vcftools with SNP output spaced 100kbp for modoc
vcftools --vcf ${workdir}/03_vcf/relatedness.all.vcf --keep modoc.txt --max-missing 1.0 --minDP 8 --max-meanDP 50 --min-alleles 2 --max-alleles 2 --mac 1 --thin 100000 --max-maf 0.49 --recode --recode-INFO-all --out ${workdir}/04_filtered_vcf_100kbp/modoc_100kbp

# run vcftools with SNP output spaced 50kbp for modoc
vcftools --vcf ${workdir}/03_vcf/relatedness.all.vcf --keep modoc.txt --max-missing 1.0 --minDP 8 --max-meanDP 50 --min-alleles 2 --max-alleles 2 --mac 1 --thin 50000 --max-maf 0.49 --recode --recode-INFO-all --out ${workdir}/05_filtered_vcf_50kbp/modoc_50kbp

# run bcftools to simplify the vcftools output for the 100kbp spacing for each species
bcftools query -f '%CHROM\t%POS\t%REF\t%ALT[\t%GT]\n ' ${workdir}/04_filtered_vcf_100kbp/herculeanus_100kbp.recode.vcf > ${workdir}/04_filtered_vcf_100kbp/herculeanus_100kbp.simple.vcf

bcftools query -f '%CHROM\t%POS\t%REF\t%ALT[\t%GT]\n ' ${workdir}/04_filtered_vcf_100kbp/laevissimus_100kbp.recode.vcf > ${workdir}/04_filtered_vcf_100kbp/laevissimus_100kbp.simple.vcf

bcftools query -f '%CHROM\t%POS\t%REF\t%ALT[\t%GT]\n ' ${workdir}/04_filtered_vcf_100kbp/modoc_100kbp.recode.vcf > ${workdir}/04_filtered_vcf_100kbp/modoc_100kbp.simple.vcf


# run bcftools to simplify the vcftools output for the 50kbp spacing for each species
bcftools query -f '%CHROM\t%POS\t%REF\t%ALT[\t%GT]\n ' ${workdir}/05_filtered_vcf_50kbp/herculeanus_50kbp.recode.vcf > ${workdir}/05_filtered_vcf_50kbp/herculeanus_50kbp.simple.vcf

bcftools query -f '%CHROM\t%POS\t%REF\t%ALT[\t%GT]\n ' ${workdir}/05_filtered_vcf_50kbp/laevissimus_50kbp.recode.vcf > ${workdir}/05_filtered_vcf_50kbp/laevissimus_50kbp.simple.vcf

bcftools query -f '%CHROM\t%POS\t%REF\t%ALT[\t%GT]\n ' ${workdir}/05_filtered_vcf_50kbp/modoc_50kbp.recode.vcf > ${workdir}/05_filtered_vcf_50kbp/modoc_50kbp.simple.vcf

