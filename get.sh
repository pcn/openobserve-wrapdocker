#!/bin/bash

# Download the openobserve v0.5.0 statically linked binary

set -x -e

export VER="v0.5.0"
export ARTIFACT="openobserve-${VER}-linux-amd64-musl.tar.gz"

if [ ! -f openobserve ] ; then
    curl -L -O https://github.com/openobserve/openobserve/releases/download/${VER}/${ARTIFACT}
    tar -xzf $ARTIFACT
fi

docker build --build-arg "VER=${VER}" -t local-openobserve-latest .
