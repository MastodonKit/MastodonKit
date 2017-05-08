#!/bin/sh

set -eo pipefail

if [ "$#" -ne 1 ]; then
    echo "should be invoked like 'gen-docs.sh <VERSION>'"
    exit 1
fi

if [ ! -f .jazzy.yaml ]; then
    echo "anonymization requires invokation from the project root"
    exit 1
fi

PROJECT_DIR=`pwd`
VERSION="$1"
bundle install
bundle exec jazzy --clean --module-version "$VERSION"

echo "anonymizing undocumented"
sed -e "s#$PROJECT_DIR#AnonymousDir#g" -i "" docs/undocumented.json
