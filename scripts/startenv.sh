#~/bin/bash

echo 'Choose an environment:'
echo '1. Hyprland'
echo '2. Sway'
echo '3. Niri'
echo '4. Qtile'
echo '5. River'
echo '6. Cage'
echo '8. KDE Plasma'
echo '9. GNOME (Not Supported)'
echo '10. Deepin (Not Supported)'

read -p 'Enter your choice (1-10): ' choice

case $choice in
1)
  env="Hyprland"
  exec_line="hyprland"
  ;;
2)
  env="Sway"
  exec_line="sway"
  ;;
3)
  env="Niri"
  exec_line="niri"
  ;;
4)
  env="Qtile"
  exec_line="qtile start"
  ;;
5)
  env="River"
  exec_line="river"
  ;;
6)
  env="Cage"
  exec_line="cage -s ghostty"
  ;;
8)
  env="KDE Plasma"
  exec_line="startplasma-waylan"
  ;;
*)
  echo "Invalid choice"
  exit 1
  ;;
esac

echo "Starting $env..."
