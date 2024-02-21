# Rocker R Version: 4.3.2
FROM rocker/r-ver@sha256:f72b46516c15b95a84907c465c449d1e7733bbb73b145aaccaf36005e39896d8
# https://hub.docker.com/layers/rocker/r-ver/4.3.2/images/sha256-f72b46516c15b95a84907c465c449d1e7733bbb73b145aaccaf36005e39896d8?context=explore

ENV R_PAPERSIZE=a4

# System Packages & Dependecies
# https://packagemanager.posit.co/client/#/
RUN apt-get update && apt-get install -y \
    # Ubuntu
    sudo \
    nano \
    make \
    automake \
    wget \
    pandoc \
    pandoc-citeproc \
    cmake \
    gcc \
    g++ \
    gfortran \
    gsfonts \
    ### Basic TCP/IP networking system
    netbase \ 
    ### Google Chrome on Ubuntu
    chromium-browser \
    ### R Package Requirements
    libicu-dev \
    zlib1g-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libxml2-dev \
    libharfbuzz-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libglpk-dev \
    libgmp3-dev \
    libpq-dev \
    libcairo2-dev \
    libxt-dev \
    libssh2-1-dev \
   # libssl1.1 \
    libmpfr-dev \
    libgit2-dev \
    default-libmysqlclient-dev \
    libsasl2-dev \
    libsqlite3-dev \
    libxtst6 \
    libtiff5-dev \
    unixodbc-dev \
    libquantlib0* \
    libmagick++-dev \
    libpq-dev \
    ### Python
    python3 \
    ### Java
    openjdk-7-* \
    default-jre \
    default-jre-headless \
    default-jdk \
    libgdal-dev \
    libproj-dev \
    liblapack-dev \
    # Clean Up
    && rm -rf /var/lib/apt/lists/*
    
# rJava
RUN R CMD javareconf

# Install specific renv version
RUN R -e "install.packages('remotes')"

# renv: 1.0.3
RUN R -e "remotes::install_github('rstudio/renv@v1.0.3')"

# Copy renv.lock
COPY renv.lock /

# Restore renv
RUN R -e "setwd('/');options(timeout = 500);renv::restore()"
