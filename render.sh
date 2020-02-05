#!/bin/bash
set -eu -o pipefail

echo Rendering from ./deployment/ to ./rendered/

if [ -z ${DEBUG+x} ]; then
  echo DEBUG not active. Not showing parameters applied to the rendering.
else
  echo Applying the following values from the environment:
  env
fi

mkdir -p ./rendered/

for f in ./deployment/*.yml
do
  echo Rendering ${f}...
  envsubst < $f > "./rendered/$(basename $f)"
done

exit 0