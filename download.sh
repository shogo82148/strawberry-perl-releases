#!/bin/bash

set -uex
ROOT=$(git rev-parse --show-toplevel)
VERSION=$1
mkdir -p "$ROOT/download/strawberry-perl-$VERSION"
cd "$ROOT/download/strawberry-perl-$VERSION"

curl -f --retry 3 -C - -LO "https://github.com/StrawberryPerl/Perl-Dist-Strawberry/releases/download/SP_${VERSION//.}_64bit/strawberry-perl-$VERSION-64bit-PDL.zip"
curl -f --retry 3 -C - -LO "https://github.com/StrawberryPerl/Perl-Dist-Strawberry/releases/download/SP_${VERSION//.}_64bit/strawberry-perl-$VERSION-64bit-portable.zip"
curl -f --retry 3 -C - -LO "https://github.com/StrawberryPerl/Perl-Dist-Strawberry/releases/download/SP_${VERSION//.}_64bit/strawberry-perl-$VERSION-64bit.msi"
sha1sum -- *.msi *.zip > sha1sum.txt
sha256sum -- *.msi *.zip > sha256sum.txt
