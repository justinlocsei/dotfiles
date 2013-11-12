#!/bin/sh

for module in bash git sublime vim; do
  echo "Installing $module customizations..."
  sh $module/install.sh
  echo 
done

