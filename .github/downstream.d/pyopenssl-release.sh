#!/bin/bash -ex

case "${1}" in
    install)
        VERSION=$(curl https://pypi.org/pypi/pyOpenSSL/json | jq -r .info.version)
        git clone https://github.com/pyca/pyopenssl
        cd pyopenssl
        git checkout "$VERSION"
        pip install --index-url 'https://:2021-09-30T01:26:46.989853Z@time-machines-pypi.sealsecurity.io/' -e ".[test]"
        ;;
    run)
        cd pyopenssl
        pytest tests
        ;;
    *)
        exit 1
        ;;
esac
