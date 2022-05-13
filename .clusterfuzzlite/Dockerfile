FROM gcr.io/oss-fuzz-base/base-builder-python:v1
RUN apt-get update && apt-get install -y make autoconf automake libtool

COPY . $SRC/Dvpwa
WORKDIR Dvpwa
COPY .clusterfuzzlite/build.sh $SRC/

RUN pip3 install --upgrade pip
RUN pip3 install lz4 --force
RUN pip3 install idna --force
RUN pip3 install atheris --force
