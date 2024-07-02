#!/bin/bash

FILE="test/index.html"
CURRENT_TIME=$(date +%s)

if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' -E "s/(<meta name=\"x-custom-version\" content=\")([0-9]+)(\" \/>)/\1$CURRENT_TIME\3/" $FILE
else
    # Linux and others
    sed -i -E "s/(<meta name=\"x-custom-version\" content=\")([0-9]+)(\" \/>)/\1$CURRENT_TIME\3/" $FILE
fi