import os
import sys
from pathlib import Path

args = sys.argv
if len(args) != 3:
    raise Exception(
        "Incorrect number of arguments! 2 Required (/path/to/background, name):",
        args[1:],
        "args provided:",
        len(args) - 1,
    )

WALLPAPER = args[1]
THEME_NAME = args[2]
FORMATTED_NAME = f"{THEME_NAME.replace(" ", "_").lower()}"


def create_script():
    THEME_PATH = Path(f"/home/zach/scripts/themes")

    # TEMPLATE
    string = f"wal -i {WALLPAPER}\n"
    string += f"waypaper --wallpaper {WALLPAPER}\n"
    string += f"cp /home/zach/.cache/wal/colors-hyprland.conf /home/zach/.config/hypr/colors.conf && hyprctl reload"
    string += f"pywal-discord -t default"

    # creation
    with open(f"{THEME_PATH}/{FORMATTED_NAME}.sh", "w") as f:
        f.write(string)

    # permissions
    os.system(f"chmod +x {THEME_PATH}/{FORMATTED_NAME}.sh")


def create_application():
    APP_PATH = Path(f"/home/zach/.local/share/themes/applications")
    THEME_PATH = Path(f"/home/zach/scripts/themes/{FORMATTED_NAME}.sh")

    # TEMPLATE
    string = "[Desktop Entry]\n"
    string += "Type=Application\n"
    string += f"Name={THEME_NAME}\n"
    string += f"Exec=/usr/bin/env bash -c '{THEME_PATH}'\n"
    string += f"Icon={WALLPAPER}\n"
    string += "Terminal=false"

    # writing
    with open(f"{APP_PATH}/{FORMATTED_NAME}.desktop", "w") as f:
        f.write(string)


create_script()
create_application()
