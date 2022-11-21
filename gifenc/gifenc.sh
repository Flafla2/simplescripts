#!/bin/sh
# http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html
# Usage: % ./gifenc.sh video.mkv anim.gif

if [ -z "$1" ] && [ -z "$2" ]
then
	echo "Usage:\n$0 <input_video> <output.gif>";
	exit;
fi
palette="/tmp/palette.png"

filters="fps=15,scale=320:-1:flags=lanczos"

ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
