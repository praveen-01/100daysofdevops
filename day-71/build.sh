#!/bin/bash

PACKAGE_PASSWORD="Bl@kW"

echo "Starting installation of package: $PACKAGE on ststor01..."

echo $PACKAGE_PASSWORD | sudo -S yum install -y $PACKAGE

if [ $? -eq 0 ]; then
    echo "SUCCESS: Package '$PACKAGE' installed successfully."
else
    echo "FAILURE: Package '$PACKAGE' installation failed. Check server logs."
    exit 1
fi