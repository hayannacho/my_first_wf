#!/usr/bin/env nextflow
nextflow.enable.dsl=2

workflow {
    Channel
        .fromPath(params.read1, checkIfExists: true)
        .set { read1 }

    Channel
        .fromPath(params.read2, checkIfExists: true)
        .set { read2 }

    fastp(read1, read2) | spades
    fastp.out | seqkit_stats
}

process fastp {
    tag "fastp on ${read1}"

    container 'quay.io/biocontainers/fastp:0.23.2--h5f740d0_3'
    publishDir params.outdir, mode: 'copy'

    input:
    path read1
    path read2

    output:
    path 'clean_1.fastq'
    path 'clean_2.fastq'

    script:
    """
    fastp -i $read1 -I $read2 -o clean_1.fastq -O clean_2.fastq -w ${task.cpus}
    """
}

process spades {
    tag "spades on cleaned reads"

    container 'quay.io/biocontainers/spades:3.15.3--h95f258a_0'
    publishDir params.outdir, mode: 'copy'

    input:
    path 'clean_1.fastq'
    path 'clean_2.fastq'

    output:
    path 'spades_output'

    script:
    """
    spades.py --careful --phred-offset 33 -t ${task.cpus} -m ${task.memory.toGiga()} -1 clean_1.fastq -2 clean_2.fastq -o spades_output
    """
}

process seqkit_stats {
    tag "seqkit on cleaned reads"

    container 'quay.io/biocontainers/seqkit:2.3.1--h9ee0642_0'
    publishDir params.outdir, mode: 'copy'

    input:
    path 'clean_1.fastq'
    path 'clean_2.fastq'

    output:
    path 'seqkit_stats.txt'

    script:
    """
    seqkit stats clean_1.fastq clean_2.fastq > seqkit_stats.txt
    """
}


