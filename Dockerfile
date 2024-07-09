# Use the official Ubuntu 22.04 as the base image
FROM ubuntu:24.04

# Set the DEBIAN_FRONTEND to noninteractive to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install essential packages
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    openjdk-11-jdk \
    build-essential \
    unzip \
    zip \
    && rm -rf /var/lib/apt/lists/*

# Download and install Bazelisk
RUN curl -Lo /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64 \
    && chmod +x /usr/local/bin/bazel

# Verify Bazelisk installation
RUN bazel version

# Set the working directory
WORKDIR /workspace
