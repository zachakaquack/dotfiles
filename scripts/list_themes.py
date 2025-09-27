import os
from pathlib import Path

themes = []
images = []

home = Path.home()
themes_path = home / "scripts/themes"
for dir, _, files in os.walk(f"{themes_path}"):
    for file in files:
        p = os.path.join(dir, file)
        themes.append(p)

        with open(p, "r") as f:
            image = f.readlines()[1]
            image = image.split(" ")
            image = image[-1]
            image = image.replace("~", str(home)).replace("\n", "")
            images.append(image)

# themes = ["/home/zach/scripts/themes/load_horse.sh"]
# images = ["/home/zach/Picutres/bgs/horse.jpeg"]

base_string = """
(scroll :vscroll true :hscroll false :vexpand true :hexpand true
  (box :orientation "v" :spacing 5
"""

per_row = 4
for i in range(0, len(themes), per_row):
    # start of horizontal box
    base_string += """
    (box :orientation "h" :spacing 5
    """
    #
    for j in range(per_row):

        # no overflow
        if i + j >= len(themes):
            break

        theme = themes[i + j]
        image = images[i + j].strip()
        text = Path(theme).stem.replace("_", " ").title()

        # horizontal box
        base_string += f'\t(themebutton :theme "{theme}" :img "{image}" :text "{text}") ; themebutton\n'

    # complete the horizontal box
    base_string += "\t) ; horizontal box"

# complete the vertical box and the scroller
base_string += """
  ) ; vertical box
) ; scroll
"""

print(base_string, flush=True)
