FROM ubuntu:18.04

LABEL org.label-schema.license="GPL-3.0" \
      org.label-schema.vcs-url="https://github.com/adelmofilho/Pearl-Jam/{{cookiecutter.project_slug}}/Dockerfile" \
      org.label-schema.vendor="Hope Clouds Observation" \
      maintainer="Adelmo Filho <adelmo.aguiar.filho@gmail.com>"

# Assumir defaults nas instalações 
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    gfortran \
    git \
    g++ \
    libreadline-dev \
    libx11-dev \
    libxt-dev \
    libpng-dev \
    libjpeg-dev \
    libcairo2-dev \   
    libcurl4-openssl-dev \
    libssl-dev \ 
    libxml2-dev \
    libudunits2-dev \
    libgdal-dev \
    libbz2-dev \
    libzstd-dev \
    liblzma-dev \
    locales \
    openjdk-8-jdk \
    screen \
    texinfo \
    texlive \
    texlive-fonts-extra \
    vim \
    wget \
    xvfb \
&& rm -rf /var/lib/apt/lists/*

# Ajuste o locale
RUN locale-gen pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8

# Instalar R

RUN wget https://cran.rstudio.com/src/base/R-3/R-3.6.3.tar.gz && \
    tar zxvf R-3.6.3.tar.gz && \
    rm R-3.6.3.tar.gz

WORKDIR /R-3.6.3

RUN ./configure --with-cairo --with-jpeglib --enable-R-shlib --with-blas --with-lapack && \ 
    make && \
    make install

# Instalar renv
ENV RENV_VERSION 0.9.2-20
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Criação do usuário para rstudio-server
ENV USER rstudio
ENV PASSWORD rstudio

RUN useradd rstudio \
  && echo "${USER}:${PASSWORD}" | chpasswd \
  && mkdir /home/${USER} \
  && chown ${USER}:${USER} /home/${USER}

# Instalar dependências
RUN apt-get update && apt-get install -y --no-install-recommends \
    gdebi-core \ 
    lsb-release \
    libapparmor1 \ 
    libedit2 \
    libclang-dev \
    sudo \
    psmisc \
    qpdf \
&& rm -rf /var/lib/apt/lists/*

# Instala rstudio-server
RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.2.5033-amd64.deb

RUN gdebi -n rstudio-server-1.2.5033-amd64.deb

RUN mkdir -p /etc/R \
  && echo 'if(is.na(Sys.getenv("HTTR_LOCALHOST", unset=NA))) { options(httr_oob_default = TRUE) }' >> /usr/local/lib/R/etc/Rprofile.site \
  && echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron \
  && echo 'rsession-which-r=/usr/local/bin/R' >> /etc/rstudio/rserver.conf \
  && echo 'lock-type=advisory' >> /etc/rstudio/file-locks

# Configura sistema s6 para inicialização do rstudio-server com o container
RUN git config --system credential.helper 'cache --timeout=3600' \
 && git config --system push.default simple \
 && wget -P /tmp/ https://github.com/just-containers/s6-overlay/releases/download/v1.21.7.0/s6-overlay-amd64.tar.gz \
 && tar xzf /tmp/s6-overlay-amd64.tar.gz -C / \
 && mkdir -p /etc/services.d/rstudio \
 && echo "#!/usr/bin/with-contenv bash \
          \n## load /etc/environment vars first: \
  		  \n for line in $( cat /etc/environment ) ; do export $line ; done \
          \n exec /usr/lib/rstudio-server/bin/rserver --server-daemonize 0" \
          > /etc/services.d/rstudio/run \
 && echo "#!/bin/bash \
          \n rstudio-server stop" \
          > /etc/services.d/rstudio/finish \
 && mkdir -p /home/rstudio/.rstudio/monitored/user-settings \
 && echo "alwaysSaveHistory='0' \
          \nloadRData='0' \
          \nsaveAction='0'" \
          > /home/rstudio/.rstudio/monitored/user-settings/user-settings \
 && chown -R rstudio:rstudio /home/rstudio/.rstudio

WORKDIR home/{project_slug}

RUN chmod 777 home/{{cookiecutter.project_slug}}
RUN chmod 777 /home

CMD ["/init"]
