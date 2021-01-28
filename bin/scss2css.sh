#!/bin/bash

# Example how to call this script
# ./extension/mugo_bootstrap/bin/scss2css.sh my_extension_name

EXTENSION_DIRECTORY=$1
DESIGN_DIRECTORY=$EXTENSION_DIRECTORY
MAIN_STYLESHEET_FILE="main"

./vendor/scssphp/scssphp/bin/pscss -s compressed < "extension/$EXTENSION_DIRECTORY/design/$DESIGN_DIRECTORY/scss/$MAIN_STYLESHEET_FILE.scss" > "extension/$EXTENSION_DIRECTORY/design/$DESIGN_DIRECTORY/stylesheets/$MAIN_STYLESHEET_FILE.css"