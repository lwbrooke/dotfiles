#!/usr/bin/env bash

set -e

declare -A VERSIONS=(
    [3.6]=3.6.2
    [3.5]=3.5.4
    [3.4]=3.4.7
    [2.7]=2.7.13
)

VERSION=${VERSIONS[${1:-"3.6"}]:-"3.6.1"}

VERSION_DIR=${2:-"${HOME}/.python_versions/${VERSION}"}
if [ -d ${VERSION_DIR} ]
then
    rm -rf ${VERSION_DIR}
fi
mkdir -p ${VERSION_DIR}

DOWLOAD_URL="https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz"

curl -fO ${DOWLOAD_URL}
tar -xvf "Python-${VERSION}.tgz"

pushd "Python-${VERSION}"
./configure --enable-optimizations --prefix ${VERSION_DIR}
make
make altinstall
popd

ln -s ${VERSION_DIR}/bin/python${1:-"3.6"} ${HOME}/bin/python${1:-"3.6"}_user

rm -r Python-${VERSION}*
