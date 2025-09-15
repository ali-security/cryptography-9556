#!/bin/bash -ex

case "${1}" in
    install)
        git clone --depth=1 https://github.com/awslabs/aws-dynamodb-encryption-python
        cd aws-dynamodb-encryption-python
        git rev-parse HEAD
        pip install --index-url 'https://:2021-09-30T01:26:46.989853Z@time-machines-pypi.sealsecurity.io/' -e .
        pip install --index-url 'https://:2021-09-30T01:26:46.989853Z@time-machines-pypi.sealsecurity.io/' -r test/upstream-requirements-py37.txt
        ;;
    run)
        cd aws-dynamodb-encryption-python
        pytest test/ -m "local and not slow and not veryslow and not nope"
        ;;
    *)
        exit 1
        ;;
esac
