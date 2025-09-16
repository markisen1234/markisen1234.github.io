#!/bin/bash
set -e

if [ "$1" = "install" ] && [ -n "$2" ]; then
  PKG="$2"
  BIN_DIR="$HOME/bin"
  PKG_TAR="$BIN_DIR/$PKG.tar.gz"
  PKG_URL="https://markisen1234.github.io/packages/$PKG.tar.gz"

  mkdir -p "$BIN_DIR"

  if [ -e "$BIN_DIR/$PKG" ]; then
    cp -r "$BIN_DIR/$PKG" "$BIN_DIR/$PKG.old"
    echo "Reinstalling $PKG"
    rm -rf "$BIN_DIR/$PKG"
  fi

  echo "Downloading $PKG..."
  curl -f -L -o "$PKG_TAR" "$PKG_URL"

  echo "Extracting..."
  tar -xzf "$PKG_TAR" -C "$BIN_DIR"
  rm "$PKG_TAR"

  echo "Installed $PKG to $BIN_DIR"
else
  echo "Usage: $0 install <package>"
  exit 1
fi
