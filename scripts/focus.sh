#!/bin/bash
# focus.sh in.png out.png CROP FOCUS_X,FOCUS_Y RADII_X,RADII_Y
# The rescue, for a take that shows too much. Moves the camera in and lets the room fall away
# from the people. Run film.sh on the result: exposure, colour and grain all happen there.
#   CROP   WxH+X+Y in source pixels.
#   FOCUS  the centre of the exchange, in pixels of the 1600px-wide result.
#   RADII  the half-width and half-height of the zone that stays sharp and fully lit, in the same
#          pixels. Every face in the exchange goes inside it. Beyond it the frame softens and dims.
set -e
IN="$1"; OUT="$2"; CROP="$3"; FOCUS="$4"; RADII="$5"
RX=${RADII%,*}; RY=${RADII#*,}
T=$(mktemp -d)
magick "$IN[0]" -alpha off -crop "$CROP" +repage -resize 1600x "$T/a.png"
H=$(magick identify -format '%h' "$T/a.png")
magick -size 1600x$H -define gradient:center=$FOCUS -define gradient:radii=$((RX * 2)),$((RY * 2)) radial-gradient:white-black -level 0%,50% "$T/m.png"
magick "$T/a.png" -blur 0x3 "$T/soft.png"
magick "$T/soft.png" "$T/a.png" "$T/m.png" -composite "$T/b.png"
magick "$T/m.png" +level 50%,100% "$T/light.png"
magick "$T/b.png" "$T/light.png" -compose Multiply -composite "$OUT"
rm -rf "$T"
