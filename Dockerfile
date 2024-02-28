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
ENV PATH="${PATH}:/FastQC/"

#install cellranger
RUN wget -O cellranger-7.2.0.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-7.2.0.tar.gz?Expires=1709197380&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=W1UtnyISYBoddCHqyFBBfhwOEXyNV6epYcrM1tzt1ylKU7A8UBXluS6S~QnRvZyqFW8Omtv9q2-nGUKWXZgIE0ThWodavRVg-2G~yjmngo5cMOM7nL4MX6SDH7Slgl7PBH5qGHHMSNcgmBjHePPO3XoE96WfOF~9LIKJINFF2jzeYMrOqOowmpElOncjkc2w2NLyWzv-uIMuhT9GNb4Rk~729RE57QOmrrAMlZs10JMEoh3aedvCOUJspMeuK2mVLtnlnhyT6kHhPAMWgDNOQR2mpgsoqjjdIsB~9upR8rtxPonkhxeU1Z~tlLxayfF2vwe-yxlwaBhcJc2WJ5MSrA__" && \
    tar -zxvf cellranger-7.2.0.tar.gz && \
    cd cellranger-7.2.0
ENV PATH="${PATH}:/cellranger-7.2.0/"

# set working directory
WORKDIR /home
