#!/bin/sh
# Recreates ./full-moon (ignored by git): the full_moon crate from crates.io,
# with every patch in this directory applied. `[patch.crates-io]` in Cargo.toml
# points at that directory, so run this once after cloning, before building.
#
#   ./patches/full-moon/apply.sh
#
# To apply a patch to another full-moon checkout instead, run from the crate
# root (the directory holding `src/`):  patch -p1 < 0001-....patch
# The Cargo.toml hunk targets the crates.io manifest; on a git checkout add
# `hexm = ["lua54"]` to `[features]` by hand if that hunk is rejected.
set -eu

VERSION=3.0.0
SHA256=5bc70b300f9b09c409fa0a68a9f0c3e6b43573e47680d16932a0f8dade11a193

PATCHES=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$PATCHES/../.." && pwd)
DEST="$ROOT/full-moon"

if [ -e "$DEST" ]; then
    echo "error: $DEST already exists, remove it first to recreate it" >&2
    exit 1
fi

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

curl -fsSL "https://static.crates.io/crates/full_moon/full_moon-$VERSION.crate" -o "$TMP/full_moon.crate"

if command -v sha256sum >/dev/null 2>&1; then
    ACTUAL=$(sha256sum "$TMP/full_moon.crate" | cut -d' ' -f1)
else
    ACTUAL=$(shasum -a 256 "$TMP/full_moon.crate" | cut -d' ' -f1)
fi
if [ "$ACTUAL" != "$SHA256" ]; then
    echo "error: checksum mismatch for full_moon-$VERSION.crate" >&2
    exit 1
fi

tar -xzf "$TMP/full_moon.crate" -C "$TMP"

for patch_file in "$PATCHES"/*.patch; do
    echo "applying $(basename "$patch_file")"
    patch -s -d "$TMP/full_moon-$VERSION" -p1 <"$patch_file"
done

mv "$TMP/full_moon-$VERSION" "$DEST"
echo "created $DEST (full_moon $VERSION, patched)"
