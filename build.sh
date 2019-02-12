#!/bin/bash 

# Log commands as they run and fail noisily
set -ex

# Set environment variables
export RUN=

# Build the slides in rmarkdown
make slides

# Send output
cp babynames/babynames.csv babynames/babynames.log /output
cp intro-to-scrapy.html /publish/index.html
