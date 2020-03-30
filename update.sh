#!/bin/sh

set -eu

BASE=https://github.com/shellspec/shellspec/archive
VERSION=${1:?Version not specified}
URL="$BASE/$VERSION.tar.gz"

sha256() {
  sha256sum
}

hash=$(curl -sSfL "$URL" | sha256 | cut -f1 -d" ")

sed -i -E "s|url .*|url \"$URL\"|; s|sha256 .*|sha256 \"$hash\"|;" shellspec.rb
