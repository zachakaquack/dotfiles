import os
import sys
from pathlib import Path

args = sys.argv

WALLPAPER = args[1]
THEME_NAME = args[2]
FORMATTED_NAME = f"{THEME_NAME.replace(" ", "_").lower()}"
THEME_PATH = Path(f"/home/zach/scripts/themes")
os.system(f"{THEME_PATH}/{FORMATTED_NAME}.sh")
