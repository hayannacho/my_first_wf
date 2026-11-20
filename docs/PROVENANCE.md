# Archive comparison and current changes

Original source: `GATECH/Spring2025/biol7210/my_first_wf/` in the user-supplied `GATECH.zip`. Baseline public commit: `1af7c15`. [SHA-256 comparison](source-comparison.json).

Before this update, `main.nf`, `nextflow.config`, `data/mini_1.fastq` and `data/mini_2.fastq` were byte-for-byte identical to that archive. The two data files are unchanged by this update. The input files retain the original ENA attribution; the original subsampling procedure was not re-created.

## Changes made during this review

- Preserve the original three-process topology and process names.
- Add `--read1`, `--read2` and `--outdir`; resolve default inputs relative to the project and fail for missing files.
- Publish new outputs under `output/` and remove the duplicated SPAdes directory level.
- Prune the committed historical `results/` tree to its final products and run record: `clean_1.fastq`, `clean_2.fastq`, `seqkit_stats.txt`, `spades_output/contigs.fasta`, `spades_output/params.txt` and `spades_output/spades.log`. The 91 SPAdes working files removed (per-k `configs/*.info`, `pipeline_state/` markers, assembly graphs, BWA indexes, error-corrected reads, mismatch-corrector output) are tool internals and remain in the Git history. The kept files are byte-identical to the archived run; the duplicated `spades_output/spades_output/` level is flattened.
- Pass task CPUs to fastp/SPAdes, use two CPUs and a 4 GB SPAdes limit for the small examples, and declare Phred+33 to avoid ambiguous quality-offset autodetection on synthetic data.
- Add a Dockerfile for a complete Linux amd64 execution environment, pinned Nextflow distribution checksum, synthetic read generator and output checks.
- Update ignored generated files and README to distinguish archived results, current verification, input provenance and assembly limits.

The existing per-process BioContainers tags and docker profile are retained for historical continuity, but were not the execution environment used in this review. Current maintenance changes are not represented as the original course submission or as implementations of the external tools.
