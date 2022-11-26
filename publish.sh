#!/bin/bash

set -uex
ROOT=$(git rev-parse --show-toplevel)
VERSION=$1

gh release create --title "Stawberry Perl $VERSION" "$VERSION" "$ROOT/download/strawberry-perl-$VERSION"/*
