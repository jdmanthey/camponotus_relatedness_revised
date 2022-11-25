interactive -p quanah

cd /lustre/scratch/jmanthey/12_relatedness/03_vcf

grep "#" scaffold0001__a.recode.vcf > relatedness.all.vcf

for i in $( ls *recode.vcf ); do
grep -v "#" $i >> relatedness.all.vcf;
done

rm *recode*

rm *idx

