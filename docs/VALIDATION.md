# Execution validation

Checked 2026-11-13 in Linux amd64 containers on an Apple Silicon host. The original workflow completed all three stages before modification. The final code then completed all three stages on both archived and synthetic inputs using the supplied Dockerfile environment.

## Tested environment

- Nextflow 24.10.5, Java 17
- fastp 0.23.4
- SPAdes 3.15.5
- SeqKit 2.3.0
- Python 3.12.3 for synthetic generation and output checks

These differ from the older per-process BioContainers tags retained in `main.nf`. That docker profile was not revalidated. Ubuntu package versions can change on rebuild; Nextflow's distribution version and SHA-256 are checked by the Dockerfile.

## Final observed outputs

| Input | Clean reads per mate | Contigs | Total contig bases |
| --- | ---: | ---: | ---: |
| Archived subset | 4708 | 2 | 71 |
| Synthetic demo | 300 | 1 | 1496 |

Both runs had `COMPLETED` / exit 0 for fastp, SPAdes and SeqKit. A further synthetic run with spaces in both input filenames also completed all three stages and passed the output checks. `tests/check_outputs.py` verified nonempty well-formed paired FASTQ with equal mate counts, both entries in the SeqKit report and a nonempty assembly.

The archived subset began with 5,000 reads per mate; the synthetic input began with 300 reads per mate. These are execution checks, not evidence of assembly accuracy, clinical significance or full-genome reconstruction. The 71-base total assembly from the small archived subset is not a useful reconstructed genome.

## Corrections found during verification

- The original publishing path duplicated `spades_output/`; the revised default publishes under `output/spades_output/`.
- Synthetic constant-quality reads caused SPAdes quality-offset autodetection to fail; explicit Phred+33 resolved the failure. The documented workflow expects Phred+33 inputs.
- Inputs and output paths are now configurable, with missing-path checking. Small-demo resource limits are explicit.

Original historical `results/` and `flow.png` are retained as archive artifacts, not current validation evidence. The default output directory and synthetic generated inputs are ignored by Git.
