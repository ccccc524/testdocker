FROM rocker/rstudio:latest

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libxml2-dev \
    libxt-dev \
    libv8-dev \
    libudunits2-dev

RUN apt-get update && apt-get install libgdal-dev

  

# install R packages required 
# (change it dependeing on the packages you need)
RUN R -e "install.packages(c('tidyverse','lubridate','rgdal','readr','aws.s3','sf'), repos='http://cran.rstudio.com/')"


#RUN R -e "devtools::install_version('rgdal', version='1.2-20')"



# copy the app to the image
#COPY shiny_itam.Rproj /srv/shiny-server/
#COPY app.R /srv/shiny-server/
#COPY llave_edos.csv /srv/shiny-server/llave_edos.csv
#COPY www /srv/shiny-server/www
#COPY datos /srv/shiny-server/datos
#COPY estados /srv/shiny-server/estados

# select port
#EXPOSE 3838

# allow permission
#RUN sudo chown -R shiny:shiny /srv/rstudio

# run app
#CMD ["/usr/bin/rstudio.sh"]