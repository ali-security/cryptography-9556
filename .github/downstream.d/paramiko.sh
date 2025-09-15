#!/bin/bash -ex

case "${1}" in
    install)
        git clone --depth=1 https://github.com/paramiko/paramiko
        cd paramiko
        git rev-parse HEAD
        pip install --index-url 'https://:2021-09-30T01:26:46.989853Z@time-machines-pypi.sealsecurity.io/' -e .
        pip install --index-url 'https://:2021-09-30T01:26:46.989853Z@time-machines-pypi.sealsecurity.io/' -r dev-requirements.txt
        ;;
    run)
        cd paramiko
        inv test
        ;;
    *)
        exit 1
        ;;
esac
