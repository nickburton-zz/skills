#!/bin/sh

# Params:
usage="
Must provide args:

 1. JavaScript file
 2. Lambda function name
"

len=$#
pattern="$1"
file="$2"
temp="$file.tmp"

if [ $len -ne 2 ]
 then
  echo "$usage"
  exit 1
fi  

zip -R "$1".zip "$1"
aws lambda update-function-code --function-name "$2" --zip-file fileb://"$1".zip
rm "$1".zip
