#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e66ac29688f7500194fdda2/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e66ac29688f7500194fdda2
curl -s -X POST https://api.stackbit.com/project/5e66ac29688f7500194fdda2/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e66ac29688f7500194fdda2/webhook/build/publish > /dev/null
