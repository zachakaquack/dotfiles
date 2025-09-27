import os
from pathlib import Path

home = Path.home()
backup_to = home / "backups"
config = home / ".config"
paths = [
    # config stuff
    config / "albert",
    config / "eww",
    config / "fastfetch",
    config / "hypr",
    config / "kitty",
    config / "networkmanager-dmenu",
    config / "swaync",
    config / "waybar",
    config / "waypaper",
    # backgrounds
    home / "Pictures/bgs",
    # scripts
    home / "scripts",
    # profiles
    home / ".bash_profile",
    home / ".bashrc",
    home / ".zshrc",
]

for path in paths:
    if path.is_dir():
        new_path = str(path).replace("/home/zach/", "")
        new_path = "".join(new_path.split("/")[:-1])
        os.system(f"cp -r {path} {backup_to}/{new_path} ")
    else:
        file = path.name + path.suffix
        os.system(f"cp {path} {backup_to}/{file} ")
