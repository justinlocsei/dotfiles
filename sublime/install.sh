#!/bin/sh

#------------------------------------------------------------------------------
# Install preference files and snippets for Sublime Text 2 on OS X
#------------------------------------------------------------------------------

SUBLIME_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/User"
PREFS_DIR="`pwd`/sublime"
cd "$PREFS_DIR"

# Create symlinks to preference files
for file in *; do
  if [[ -f "$file" ]]; then
    if [[ -f "$SUBLIME_DIR/$file" ]]; then
      echo "Removing existing preference file: $file"
      rm "$SUBLIME_DIR/$file" 
    fi
    echo "Linking preference file: $file"
    ln -s "$PREFS_DIR/$file" "$SUBLIME_DIR/$file"
  fi
done

# Create symlinks to subdirectories
for directory in *; do
  if [[ -d "$directory" ]]; then
    if [[ -d "$SUBLIME_DIR/$directory" ]]; then
      echo "Removing existing directory: $directory"
      rm -R "$SUBLIME_DIR/$directory"
    fi
    echo "Linking directory: $directory"
    ln -s "$PREFS_DIR/$directory" "$SUBLIME_DIR/$directory"
  fi
done

