interactive -p quanah

cd /lustre/scratch/jmanthey/12_relatedness/06_related_files

# copy files
cp ../04_filtered_vcf_100kbp/*simple* .

cp ../05_filtered_vcf_50kbp/*simple* .

cp ../12_filter_scripts/herculeanus.txt .

cp ../12_filter_scripts/laevissimus.txt .

cp ../12_filter_scripts/modoc.txt .


# load R
module load intel R

R


# convert to related package style format

source("vcf_to_related.r")

vcf_to_related("herculeanus_100kbp.simple.vcf", "herculeanus_filtered_100kbp.related", "herculeanus.txt")

vcf_to_related("herculeanus_50kbp.simple.vcf", "herculeanus_filtered_50kbp.related", "herculeanus.txt")

vcf_to_related("laevissimus_100kbp.simple.vcf", "laevissimus_filtered_100kbp.related", "laevissimus.txt")

vcf_to_related("laevissimus_50kbp.simple.vcf", "laevissimus_filtered_50kbp.related", "laevissimus.txt")

vcf_to_related("modoc_100kbp.simple.vcf", "modoc_filtered_100kbp.related", "modoc.txt")

vcf_to_related("modoc_50kbp.simple.vcf", "modoc_filtered_50kbp.related", "modoc.txt")


