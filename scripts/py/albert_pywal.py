#!/usr/bin/env python3
import json
from pathlib import Path

# Paths
wal_file = Path.home() / ".cache/wal/colors.json"
theme_dir = Path.home() / ".local/share/albert/org.albert.frontend.qmlboxmodel/themes"
pywal_qss = theme_dir / "pywal.qss"
dark_qss = theme_dir / "dark.qss"

# Load wal colors
with open(wal_file, "r") as f:
    wal = json.load(f)["colors"]

# Map placeholders to wal colors
mapping = {
    "@background": wal["color0"],  # background
    "@cursor": wal["color7"],  # foreground / cursor color
    "@color4": wal["color4"],  # accent
}

# Base Albert theme with placeholders
base_theme = """
* {
    border: none;
    background-color: @background;
    color: @cursor;
}

#frame {
    background-color: none;
    border: none;
    max-width:640px;
    min-width:640px;
}

#inputLine {
    border-radius: 8px;
    border: 1px solid @cursor;
    color: @cursor;
    font-size: 26px;
    padding: 8px;
    selection-background-color: @cursor;
    selection-color: @cursor;
}

#settingsButton {
    background-color: none;
    color: #ff0400;

    max-height: 13px;
    max-width: 13px;
    min-height: 13px;
    min-width: 13px;

    padding: 16px;
}

QListView {
    border-radius: 8px;
    border: 1px solid @cursor;
    color: @cursor;
    margin-top: 4px;
    selection-background-color: @color4;
    selection-color: white;
}

QListView::item {
    border-radius: 6px;
    padding: 4px;
}

QListView::item:selected {
    background-color: @color4;
}

QListView#resultsList {
    font-size: 20px;
    icon-size: 34px;
    padding: 4px 8px 4px 8px;
}

QListView#resultsList::item {
    margin: 4px 0px 4px 0px;
    height: 44px;
}

QListView#actionList {
    font-size: 16px;
    padding: 6px 8px 6px 8px;
}

QListView#actionList::item {
    margin: 2px 0px 2px 0px;
}

QListView QScrollBar::add-line:vertical, QScrollBar::sub-line:vertical,
QListView QScrollBar::up-arrow:vertical, QScrollBar::down-arrow:vertical,
QListView QScrollBar::add-page:vertical, QScrollBar::sub-page:vertical {
    background: transparent;
    border: 0px;
    height: 0px;
    width: 0px;
}

QListView QScrollBar:vertical {
    background: transparent;
    margin: 8px 0px 8px 0px;
    width: 2px;
}
"""

# Replace placeholders with pywal colors
for key, val in mapping.items():
    base_theme = base_theme.replace(key, val)

# Ensure theme directory exists
theme_dir.mkdir(parents=True, exist_ok=True)

# Write both pywal.qss and dark.qss
pywal_qss.write_text(base_theme)
dark_qss.write_text(base_theme)

print(f"[+] Updated {pywal_qss}")
print(f"[+] Updated {dark_qss}")
