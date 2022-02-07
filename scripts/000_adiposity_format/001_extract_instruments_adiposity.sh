#!/bin/bash

#SBATCH --job-name=extract_metab_instruments
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-10:0:00
#SBATCH --mem=100M

# set environment arguments 
source ../../environment/environment.sh

# unzip files
gzip -d ${directory_1}adiposity_metabolites_endometrial_cancer/adiposity_GWAS/*.txt.gz

#loop through files to extract GWAS significant SNPs
ls ${directory_1}adiposity_metabolites_endometrial_cancer/adiposity_GWAS/*.txt | while read f; do awk -F" " 'NR==1{print;next}$9<5e-09' ${f} > ${directory_1}adiposity_metabolites_endometrial_cancer/data/adiposity/${f}_snps.txt; done;
