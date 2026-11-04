#!/bin/bash
# measure.sh image [image ...]
# Prints brightness, colour and near-black share, each from 0 to 1.
# Useful for catching a frame that has drifted. It can't see where the light falls, so the eye decides.
printf '%-10s %-8s %-10s %s\n' bright colour near-black file
for f in "$@"; do
  b=$(magick "$f[0]" -auto-orient -resize 1024x -colorspace Gray -format '%[fx:mean]' info:)
  c=$(magick "$f[0]" -auto-orient -resize 1024x -colorspace HCL -channel G -separate -format '%[fx:mean]' info:)
  n=$(magick "$f[0]" -auto-orient -resize 1024x -colorspace Gray -threshold 15% -format '%[fx:1-mean]' info:)
  printf '%-10.3f %-8.3f %-10.3f %s\n' "$b" "$c" "$n" "$f"
done
