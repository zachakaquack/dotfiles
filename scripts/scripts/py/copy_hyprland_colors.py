from pathlib import Path

# get the colors in rgba
home = Path.home()
all_colors_path = Path(f"{home}/.cache/wal")
rgb_path = all_colors_path / "colors"
hypr_colors_path = Path(f"{home}/.config/hypr/pywal_colors.conf")

c = [
    # "background", color0
    # "foreground", color7
    # "cursor", color7
    "color0",
    "color1",
    "color2",
    "color3",
    "color4",
    "color5",
    "color6",
    "color7",
    "color8",
    "color9",
    "color10",
    "color11",
    "color12",
    "color13",
    "color14",
    "color15",
]

colors = {}


with open(f"{rgb_path}", "r") as f:
    lines = f.readlines()
    for i in range(len(c)):
        colors[c[i]] = lines[i][:-1]

string = ""

for key, values in colors.items():
    values = values.replace(",", ",")
    values = values.split(",")
    for i, val in enumerate(values):
        values[i] = int(val[1:])
    values = tuple(values)
    hex = "#%02x%02x%02x" % (values)
    string += f"${key} = rgba({hex.replace('#', '')}ff)\n"

with open(f"{hypr_colors_path}", "w") as f:
    f.write(f"{string}")
