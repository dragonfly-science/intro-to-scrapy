#!/bin/bash 

# Log commands as they run and fail noisily
set -ex

# Set environment variables
export RUN=

# Build the slides in rmarkdown
make slides

# Send output
cp deepspeech.html /output
cp deepspeech.html /publish/index.html
