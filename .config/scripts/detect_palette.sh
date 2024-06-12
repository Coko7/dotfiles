#!/usr/bin/env sh

# Go over all images in directory and get all the unique pixel colors
# This can be used to create a color palette

rm palette.txt
for file in *.png; do
    echo "checking $file..."
    convert "$file" -depth 8 txt: | tail -n +2 | sed -n "s/^.*\(#.*\) .*$/\1/p" | sort | uniq >> palette.txt
done

res=`cat palette.txt | sort | uniq | wc -l`
echo "colors: $res"
