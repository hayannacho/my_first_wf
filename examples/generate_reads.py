"""Generate a small artificial paired-end dataset; no real sample data."""
import random
from pathlib import Path

out = Path(__file__).resolve().parent / "generated"
out.mkdir(exist_ok=True)
rng = random.Random(7210)
genome = "".join(rng.choice("ACGT") for _ in range(1500))
complement = str.maketrans("ACGT", "TGCA")
with (out / "reads_1.fastq").open("w") as r1, (out / "reads_2.fastq").open("w") as r2:
    for i in range(300):
        start = rng.randrange(len(genome) - 300 + 1)
        fragment = genome[start:start + 300]
        left = fragment[:150]
        right = fragment[-150:].translate(complement)[::-1]
        for stream, mate, sequence in [(r1, 1, left), (r2, 2, right)]:
            stream.write(f"@synthetic_{i}/{mate}\n{sequence}\n+\n{'I'*len(sequence)}\n")
print(out)
