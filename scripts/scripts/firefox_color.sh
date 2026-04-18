LIBRE_WALLPAPERS="$HOME/.librewolf/uea6t6ay.default-release/wallpaper/"

# find the current wallpaper
TO_OVERRIDE="$(ls -1 $LIBRE_WALLPAPERS)"

# find the correct color from wal
source "$XDG_CACHE_HOME/wal/colors.sh"

# create imagemagick of background
magick "$wallpaper" -gravity center -resize 1920x1080 "$XDG_CACHE_HOME/magick.png"

# 114 +
# move to new spot in ~/.librewolf/uea6t6ay.default-release/wallpaper
cp "$XDG_CACHE_HOME/magick.png" "$LIBRE_WALLPAPERS/$TO_OVERRIDE"
