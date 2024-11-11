# Use the official Ubuntu image as the base
FROM ubuntu:latest

# Set environment variables to prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt update && apt upgrade -y \
    && apt install -y \
    curl \
    wget \
    git \
    vim \
    tmux \
    zsh \
    neovim \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Set zsh as the default shell for the container
SHELL ["/bin/zsh", "-c"]

# install Oh My Zsh for a better experience
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# Set the working directory
WORKDIR /app

# Command to run when the container starts
CMD ["zsh"]
