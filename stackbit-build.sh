#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dfd34028d389c001a834a5c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dfd34028d389c001a834a5c
curl -s -X POST https://api.stackbit.com/project/5dfd34028d389c001a834a5c/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5dfd34028d389c001a834a5c/webhook/build/publish > /dev/null
