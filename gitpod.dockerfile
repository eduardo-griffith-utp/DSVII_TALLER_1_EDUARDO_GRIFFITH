FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install sudo and other essential tools
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create gitpod user and group with specific IDs
RUN groupadd -g 33333 gitpod \
    && useradd -l -u 33333 -g gitpod -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && echo "gitpod ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/gitpod \
    && chmod 0440 /etc/sudoers.d/gitpod

# Set the user
USER gitpod

# Set the working directory
WORKDIR /workspace

CMD ["/bin/bash"]
