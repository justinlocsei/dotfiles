#!/bin/sh

BASE_DIR=$PWD

for module in bash git sublime vim; do
  echo "Installing $module customizations..."
  cd "$BASE_DIR/$module"
  sh install.sh
  echo 
done

