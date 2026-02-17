#!/bin/bash
BRAND=$1 # alpha or beta

echo "Switching assets to $BRAND..."
rm -rf assets/current_brand
mkdir -p assets/current_brand

# Copy only specific brand assets
cp -r assets/brands/$BRAND/* assets/current_brand/
echo "Done."