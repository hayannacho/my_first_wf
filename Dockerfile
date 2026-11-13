FROM ubuntu:24.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends python3 fastp spades seqkit openjdk-17-jre-headless curl ca-certificates && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://github.com/nextflow-io/nextflow/releases/download/v24.10.5/nextflow-24.10.5-dist -o /usr/local/bin/nextflow \
    && echo "79c7601a7d8d6f77dd9393377da453cd1ab59e821fa41324badcdd5dfc54855b  /usr/local/bin/nextflow" | sha256sum -c - \
    && chmod +x /usr/local/bin/nextflow
WORKDIR /project
ENTRYPOINT ["nextflow"]
CMD ["run", "main.nf", "-ansi-log", "false"]
