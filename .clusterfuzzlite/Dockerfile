FROM gcr.io/oss-fuzz-base/base-builder
RUN apt-get update && apt-get install -y make autoconf automake libtool libdb-dev
RUN git clone --depth=1 https://github.com/vdukhovni/postfix Dvpwa
COPY . $SRC/Dvpwa
WORKDIR Dvpwa
COPY build.sh $SRC/
COPY *.c $SRC/
