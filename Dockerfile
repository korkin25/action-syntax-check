FROM ubuntu:latest

LABEL version="1.0"
LABEL description="Lint and check YAML files and GitHub Actions syntax"

ARG YAMLLINT_VERSION=1.32.0
ARG ACTIONLINT_VERSION=1.6.25

# Install necessary dependencies and utilities
RUN apt-get update && apt-get install -y curl python3-pip && rm -rf /var/lib/apt/lists/*

# Install yamllint and actionlint
RUN pip install yamllint==${YAMLLINT_VERSION}
RUN curl -sSLf https://github.com/rhysd/actionlint/releases/download/v${ACTIONLINT_VERSION}/actionlint_${ACTIONLINT_VERSION}_linux_amd64.tar.gz | tar xzv -C /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
