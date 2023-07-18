#!/usr/bin/bash

myName="Baris"
fileCount=25
startNumber=0
filePath="/home/mebadogan/Desktop/scripts"

for file in "$filePath"/*; do
    if [[ "$file" == *"$myName"* ]]; then
        theFileNumber=$(echo "$file" | cut -d"/" -f6 | grep -oE '[0-9]+')
        if [ "$theFileNumber" -gt "$startNumber" ]; then
            startNumber="$theFileNumber"
        fi
    fi
done
startNumber=$(($startNumber + 1))
endNumber=$(($fileCount + $startNumber - 1))

for ((count = $startNumber; count <= endNumber; count++));
do
    touch ""$filePath/Baris"$count"
done