#! /usr/bin/env bash

function download_triangle() {
  local DATE=$(date -u +"%Y-%m-%d" --date='5 hours ago')
  local EXTENSION="-x86_64.pkg.tar.zst"
  local BASE_URL="https://github.com/carlosal1015/aur/releases/download/${DATE}"
  local PACKAGE="triangle-1.6-8${EXTENSION}"
  local GH_URL="${BASE_URL}/${PACKAGE}"
  curl -LO ${GH_URL}
}