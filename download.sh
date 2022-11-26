#!/bin/bash

set -uex
ROOT=$(git rev-parse --show-toplevel)
VERSION=$1
mkdir -p "$ROOT/download/strawberry-perl-$VERSION"
cd "$ROOT/download/strawberry-perl-$VERSION"

curl --retry 3 -LO "https://strawberryperl.com/download/$VERSION/strawberry-perl-$VERSION-64bit.msi"
curl --retry 3 -LO "https://strawberryperl.com/download/$VERSION/strawberry-perl-$VERSION-64bit-PDL.zip"
curl --retry 3 -LO "https://strawberryperl.com/download/$VERSION/strawberry-perl-$VERSION-64bit-portable.zip"
curl --retry 3 -LO "https://strawberryperl.com/download/$VERSION/strawberry-perl-$VERSION-64bit.zip"
curl --retry 3 -LO "https://strawberryperl.com/download/$VERSION/strawberry-perl-$VERSION-32bit.msi"
curl --retry 3 -LO "https://strawberryperl.com/download/$VERSION/strawberry-perl-$VERSION-32bit-PDL.zip"
curl --retry 3 -LO "https://strawberryperl.com/download/$VERSION/strawberry-perl-$VERSION-32bit-portable.zip"
curl --retry 3 -LO "https://strawberryperl.com/download/$VERSION/strawberry-perl-$VERSION-32bit.zip"
curl --retry 3 -LO "https://strawberryperl.com/download/$VERSION/strawberry-perl-no64-$VERSION-32bit-portable.zip"
curl --retry 3 -LO "https://strawberryperl.com/download/$VERSION/strawberry-perl-no64-$VERSION-32bit.zip"
sha1sum -- *.msi *.zip > sha1sum.txt
sha256sum -- *.msi *.zip > sha256sum.txt
