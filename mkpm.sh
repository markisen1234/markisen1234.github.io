#!/bin/bash
set -e

BIN_DIR="$HOME/bin"

# Ensure a subcommand is provided
if [ -z "$1" ]; then
  echo "Usage: $0 install <package> | instsh <package> | rm <package>"
  exit 1
fi

SUBCMD="$1"
PKG="$2"

# Check if package name is provided for commands that need it
if [[ "$SUBCMD" != "rm" && -z "$PKG" ]]; then
  echo "Error: package name is required"
  exit 1
fi

mkdir -p "$BIN_DIR"

backup_pkg() {
  local pkg="$1"
  if [ -e "$BIN_DIR/$pkg" ]; then
    local timestamp
    timestamp=$(date +%s)
    cp -r "$BIN_DIR/$pkg" "$BIN_DIR/${pkg}.old.$timestamp"
    echo "Backing up existing $pkg to ${pkg}.old.$timestamp"
    rm --preserve-root -rf "$BIN_DIR/$pkg"
  fi
}

case "$SUBCMD" in
  install)
    PKG_TAR="$BIN_DIR/$PKG.tar.gz"
    PKG_URL="https://markisen1234.github.io/packages/$PKG.tar.gz"

    backup_pkg "$PKG"

    echo "Downloading $PKG..."
    curl -f -L -o "$PKG_TAR" "$PKG_URL"

    echo "Extracting $PKG..."
    tar -xzf "$PKG_TAR" -C "$BIN_DIR"
    rm "$PKG_TAR"

    echo "Installed $PKG to $BIN_DIR"
    ;;

  instsh)
    PKG_URL="https://markisen1234.github.io/packages/$PKG"

    backup_pkg "$PKG"

    echo "Downloading $PKG.sh..."
    curl -f -L -o "$BIN_DIR/$PKG" "$PKG_URL"
    chmod +x "$BIN_DIR/$PKG"

    echo "Installed $PKG to $BIN_DIR"
    ;;

  rm)
    if [ -z "$PKG" ]; then
      echo "Error: package name is required"
      exit 1
    fi
    if [ -e "$BIN_DIR/$PKG" ]; then
      read -p "Are you sure you want to delete $PKG? [y/n] (case sensitive): " yn
      if [ "$yn" = "y" ]; then
        rm --preserve-root -rf "$BIN_DIR/$PKG"
        echo "$PKG deleted."
      else
        echo "Cancelled"
      fi
    else
      echo "$PKG not found in $BIN_DIR"
    fi
    ;;

  *)
    echo "Unknown command: $SUBCMD"
    echo "Usage: $0 install <package> | instsh <package> | rm <package>"
    exit 1
    ;;
esac
