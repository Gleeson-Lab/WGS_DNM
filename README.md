# WGS_DNM
pipeline for variant calling, DNM filtering, and annotating WGS data

## Code Location
`/tscc/projects/ps-gleesonlab7/Pipeline_tscc2.0/NTD_WGS/WGS_DNM`

~~`/projects/ps-gleesonlab8/User/arzoo/20230901_organized_code/pipelines/DNM_WGS/WGS_DNM`~~

## Setup
in the `resources` folder
- Copy the following resource files and their indices from `/tscc/projects/ps-gleesonlab7/gleeson3/resources/hg38/`
```
Axiom_Exome_Plus.genotypes.all_populations.poly.hg38.vcf.gz
dbsnp_146.hg38.vcf.gz
hapmap_3.3.hg38.vcf.gz
Mills_and_1000G_gold_standard.indels.hg38.vcf.gz
1000G_omni2.5.hg38.vcf.gz
Homo_sapiens_assembly38.fasta
1000G_phase1.snps.high_confidence.hg38.vcf.gz
```
- Copy these from `/tscc/projects/ps-gleesonlab8/User/arzoo/20230810_Jiny_Rerun_DNM_WGS_GMKF/1.Processing/resources`
```
prioritize_smallvars.json
GRCh38_GREEN-DB.bed.gz
greendb_schema_v2.5.json
intervals/
```

## Inputs
- cram files with crai index in the format `{sample}.cram {sample}.cram.crai`
- `trios.ped` with only complete trios
- `trios.list` sample names newline separated

## Running it
- before running the snakefile: `module load singularitypro`
- run from the workflow folder using snakemake
  - make sure to include `--use-conda --use-singularity --singularity-args "-B /path/to/mounts/"` (replace `/path/to/mounts/` with all mounts that singularity needs to access
- after snakemake finished use the jupyter notebook to create a table of the most likely important variants
  - you may need to edit the parameters of the jupyter notebook to be better for your data

## General Workflow
- Starting from BQSRed cram
- Variant calling
  - Haplotype caller
  - combine , genotype, and merge gvcfs
- Multiallelic split (see notes)
  - Bcftools norm
- VQSR
  - Snp and indel recalibration
- DNM annotation
  - CGP
  - DNM filter
- Variant annotation
  - VEP (exonic)
  - SpliceAI (splice)
  - GreenVaran (promoters,enhancers)
  - Gnomad 3 whole genome annotation (VEP on the server uses an old version of exome)

## Notes
There is a jupyter notebook that can be used to extract a table of most likely to be important variants found with the pipeline

Multiallelic split
- [Biallelic vs Multiallelic sites](https://gatk.broadinstitute.org/hc/en-us/articles/360035890771-Biallelic-vs-Multiallelic-sites)
- In a multisample vcf there can be multiple samples with alternative variants in the same position
- These are usually condensed into 1 row called a multiallelic variant 

