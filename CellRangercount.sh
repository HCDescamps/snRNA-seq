#!/bin/bash

# Sample IDs
samples=(500 501 502 503 504 505 506 507)

# Shared parameters
transcriptome="/home/descamps/10X_genomics/SingleNucleus/refdata-gex-mm10-2020-A"
fastq_dir="/home/descamps/10X_genomics/SingleNucleus/fastqs/"
cores=12
mem=64

# Iterate over samples
for sample_id in "${samples[@]}"; do
  echo "Processing sample: $sample_id"

  nohup cellranger count \
    --id="$sample_id" \
    --transcriptome="$transcriptome" \
    --include-introns \
    --fastqs="$fastq_dir" \
    --sample="$sample_id" \
    --localcores="$cores" \
    --localmem="$mem" \
    > "${sample_id}_cellranger.log" 2>&1 &

  echo "Started cellranger count for $sample_id"
done