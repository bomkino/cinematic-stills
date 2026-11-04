#!/bin/bash
# film.sh in.png out.jpg GAMMA SATURATION
# The everyday finish: exposure, a little contrast, a slight softening, then grain.
#   GAMMA       above 1 lifts a dark frame, below 1 settles a bright one. 1 leaves it alone.
#   SATURATION  100 leaves colour alone, 62 calms a frame that has gone postcard.
# Grain goes on with Overlay, which leaves brightness alone. SoftLight doubled it in ImageMagick 7.1.
set -e
IN="$1"; OUT="$2"; G="$3"; SAT="$4"
T=$(mktemp -d)
magick "$IN[0]" -alpha off -gamma "$G" -modulate 100,"$SAT",100 -sigmoidal-contrast 1.5x45% +level 1.5%,99% -blur 0x0.5 "$T/a.png"
W=$(magick identify -format '%w' "$T/a.png"); H=$(magick identify -format '%h' "$T/a.png")
magick -size ${W}x${H} xc:gray50 -attenuate 0.7 +noise Gaussian -modulate 100,0,100 -blur 0x0.55 "$T/g.png"
magick "$T/a.png" "$T/g.png" -compose Overlay -composite -quality 93 "$OUT"
rm -rf "$T"
