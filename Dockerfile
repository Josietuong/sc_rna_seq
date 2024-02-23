FROM ubuntu:mantic-20230926

ARG FASTQC_VER="0.11.8"

# install dependencies; cleanup apt garbage
RUN apt-get update && apt-get install -y\
 unzip \
 wget \
 make \
 perl \
 default-jre && \
 apt-get autoclean && rm -rf /var/lib/apt/lists/*

# install fastqc
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${FASTQC_VER}.zip && \
    unzip fastqc_v${FASTQC_VER}.zip && \
    rm fastqc_v${FASTQC_VER}.zip && \
    chmod +x FastQC/fastqc && \
    mkdir /data

# set PATH and working directory
ENV PATH="${PATH}:/FastQC/"
WORKDIR /home
