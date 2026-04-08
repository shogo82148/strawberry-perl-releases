#!/bin/bash

set -uex
ROOT=$(git rev-parse --show-toplevel)
VERSION=$1

# set up
mkdir -p "$ROOT/download/strawberry-perl-$VERSION"
cd "$ROOT/download/strawberry-perl-$VERSION"

# fetch the release information
RELEASES=$(curl -f --retry 3 -sSL https://strawberryperl.com/releases.json)
EDITION=$(echo "$RELEASES" | jq -r --arg VERSION "$VERSION" '.[] | select(.version == $VERSION) | .edition')

# download the files
curl -f --retry 3 -C - -LO "$(echo "$EDITION" | jq -r '.msi.url')"
curl -f --retry 3 -C - -LO "$(echo "$EDITION" | jq -r '.pdl.url')"
curl -f --retry 3 -C - -LO "$(echo "$EDITION" | jq -r '.portable.url')"

# calculate checksums
sha1sum -- *.msi *.zip > sha1sum.txt
sha256sum -- *.msi *.zip > sha256sum.txt
