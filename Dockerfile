FROM mcoirad/datascience-r:latest

RUN apt-get update && apt-get install -y \
    git \
    libudunits2-dev \
    libprotobuf-dev \
    protobuf-c-compiler \
    libgdal-dev

COPY ./requirements.txt /requirements.txt
RUN Rscript -e "packages <- readLines('/requirements.txt'); install.packages(packages)"

COPY ./app/app.r ./app/app.r
COPY entrypoint.sh /

EXPOSE 3838

ENTRYPOINT ["/entrypoint.sh"]
