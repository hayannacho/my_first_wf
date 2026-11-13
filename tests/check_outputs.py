"""Check actual workflow products after a Nextflow run."""
import sys
from pathlib import Path

root = Path(sys.argv[1])
counts = []
for mate in (1, 2):
    lines = (root / f"clean_{mate}.fastq").read_text().splitlines()
    assert len(lines) > 0 and len(lines) % 4 == 0, "Invalid/empty FASTQ"
    for i in range(0, len(lines), 4):
        assert lines[i].startswith("@") and lines[i+2].startswith("+")
        assert len(lines[i+1]) == len(lines[i+3])
    counts.append(len(lines)//4)
assert counts[0] == counts[1], "Mate counts differ"
stats = (root / "seqkit_stats.txt").read_text()
assert "clean_1.fastq" in stats and "clean_2.fastq" in stats
contigs = (root / "spades_output" / "contigs.fasta").read_text()
assert contigs.startswith(">") and any(line and not line.startswith(">") for line in contigs.splitlines()), "Empty assembly"
print(f"Validated paired FASTQ: {counts[0]} reads per mate; SeqKit report and nonempty assembly present.")
