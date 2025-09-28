import os
from pathlib import Path

home = Path.home()
images = []

for dirpath, _, files in os.walk(f"{home}/Pictures/bgs"):
    for file in files:
        images.append(os.path.join(dirpath, file))

images.sort()

# print a single box with all background widgets inside
print('(box :orientation "v" :spacing 10')
for i in range(0, len(images), 2):
    img1 = images[i]
    img2 = images[i + 1] if i + 1 < len(images) else ""
    print(f"  (background :img1 '{img1}' :img2 '{img2}')")
print(")")
