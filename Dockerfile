FROM docker.dragonfly.co.nz/dragonverse-18.04:latest

# Install a missing linux package
RUN apt update && apt install -y tree

RUN apt install -y python3-dev python3-pip

COPY requirements.txt /root/requirements.txt
RUN pip3 install -r /root/requirements.txt

# Install a missing R package
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('gghighlight')"
RUN Rscript -e "install.packages('reports')"
RUN Rscript -e "install.packages('bookdown')"
RUN Rscript -e "install.packages('kableExtra')"
RUN Rscript -e "install.packages('DT')"
RUN Rscript -e "install.packages('reticulate')"

RUN apt update && apt install -y pandoc-citeproc
RUN apt install -y tree