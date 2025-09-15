#!/bin/bash -ex

case "${1}" in
    install)
        git clone --depth=1 https://github.com/certbot/josepy
        cd josepy
        git rev-parse HEAD
        pip install --index-url 'https://:2021-09-30T01:26:46.989853Z@time-machines-pypi.sealsecurity.io/' -e ".[tests]" -c constraints.txt
        ;;
    run)
        cd josepy
        pytest src
        ;;
    *)
        exit 1
        ;;
esac
