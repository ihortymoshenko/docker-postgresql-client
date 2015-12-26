FROM igortimoshenko/docker-cron-job

RUN apt-get update -y \
    && apt-get install -y \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*
