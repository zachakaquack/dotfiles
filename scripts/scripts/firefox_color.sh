LIBRE_WALLPAPERS="$HOME/.librewolf/uea6t6ay.default-release/wallpaper/"

# find the current wallpaper
TO_OVERRIDE="$(ls -1 $LIBRE_WALLPAPERS)"

# find the correct color from wal
source "$XDG_CACHE_HOME/wal/colors.sh"

# create imagemagick of png of like 1x1 px
magick -size 100x100 xc:"$color8" "$XDG_CACHE_HOME/magick.png"

# move to new spot in ~/.librewolf/uea6t6ay.default-release/wallpaper
cp "$XDG_CACHE_HOME/magick.png" "$LIBRE_WALLPAPERS/$TO_OVERRIDE"
