#!/bin/bash

echo "Checking for google-services.json in wrong location..."

if [ -f "src/main/java/max/ohm/oneai/google-services.json" ]; then
    echo "Found google-services.json in wrong location."
    echo "Moving to correct location..."
    
    if [ ! -f "../../google-services.json" ]; then
        cp "src/main/java/max/ohm/oneai/google-services.json" "../../google-services.json"
        echo "File copied to app/google-services.json"
    else
        echo "File already exists in correct location."
    fi
    
    rm "src/main/java/max/ohm/oneai/google-services.json"
    echo "Removed file from incorrect location."
    echo "Done!"
else
    echo "google-services.json is in the correct location."
fi

echo ""
echo "Please rebuild your app after this fix."
read -p "Press Enter to continue..." 