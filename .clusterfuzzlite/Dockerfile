FROM gcr.io/oss-fuzz-base/base-builder-python:v1
RUN apt-get update && apt-get install -y make autoconf automake libtool
RUN apt-get update && apt-get install -y make autoconf automake libtool
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        rsync \
        vim \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Due to Bazel bug, need to symlink python3 to python
# See https://github.com/bazelbuild/bazel/issues/8665
RUN ln -s /usr/local/bin/python3 /usr/local/bin/python

# Install Bazelisk to keep bazel in sync with the version required by TensorFlow
RUN curl -Lo /usr/bin/bazel \
        https://github.com/bazelbuild/bazelisk/releases/download/v1.1.0/bazelisk-linux-amd64 \
        && \
    chmod +x /usr/bin/bazel

RUN git clone --depth 1 https://github.com/tensorflow/tensorflow tensorflow

COPY . $SRC/Dvpwa
WORKDIR Dvpwa
COPY .clusterfuzzlite/build.sh $SRC/

RUN pip3 install --upgrade pip
RUN pip3 install coverage
RUN pip3 install lz4 --force
RUN pip3 install idna --force
RUN pip3 install atheris --force
