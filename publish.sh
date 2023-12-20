#!/bin/bash

set -uex
ROOT=$(git rev-parse --show-toplevel)
VERSION=$1

gh release create \
    --title "Strawberry Perl $VERSION" \
    --notes "" \
    "$VERSION" "$ROOT/download/strawberry-perl-$VERSION"/*
