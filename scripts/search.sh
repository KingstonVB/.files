#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <package_name>"
    exit 1
fi

query="$1"

echo "------------------------------"

pacman_result=$(pacman -Si "$query" 2>/dev/null)
if [ -n "$pacman_result" ]; then
    version=$(echo "$pacman_result" | grep -m1 "Version" | awk '{print $3}')
    date=$(echo "$pacman_result" | grep -m1 "Build Date" | cut -d: -f2- | xargs)
    echo "Pacman (Official Repo)"
    echo "Version:    $version"
    echo "Build Date: $ Date"
else
    echo "Pacman: Not found"
fi

echo "------------------------------"

flatpak_result=$(flatpak search --columns=application,version "$query" 2>/dev/null | grep -i "$query")
if [ -n "$flatpak_result" ]; then
    while read -r line; do
        app_id=$(echo "$line" | awk '{print $1}')
        version=$(echo "$line" | awk '{print $2}')
        # Get last update date from remote info
        update_date=$(flatpak remote-info flathub "$app_id" 2>/dev/null | grep -m1 "Updated" | cut -d: -f2- | xargs)
        echo "Flatpak (Flathub)"
        echo "App ID:       $app_id"
        echo "Version:      $version"
        echo "Last Updated: ${update_date:-Unknown}"
    done <<< "$flatpak_result"
else
    echo "Flatpak: Not found"
fi

echo "------------------------------"

aur_result=$(paru -Si "$query" 2>/dev/null | grep -i "Name\|Version\|Last Updated")
if [ -n "$aur_result" ]; then
    name=$(echo "$aur_result" | grep -m1 "Name" | awk '{print $3}')
    version=$(echo "$aur_result" | grep -m1 "Version" | awk '{print $3}')
    last_updated=$(echo "$aur_result" | grep -m1 "Last Updated" | cut -d: -f2- | xargs)
    echo "AUR"
    echo "Name:         $name"
    echo "Version:      $version"
    echo "Last Updated: $last_updated"
else
    echo "AUR: Not found"
fi
