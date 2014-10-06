#!/bin/bash
xdg-mime default chromium.desktop x-scheme-handler/http
xdg-mime default chromium.desktop x-scheme-handler/https
xdg-mime default chromium.desktop text/html
xdg-mime default Thunar.desktop inode/directory

dconf write /org/gnome/shell/enabled-extensions "['alternate-tab@gnome-shell-extensions.gcampax.github.com', 'workspace-indicator@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'native-window-placement@gnome-shell-extensions.gcampax.github.com', 'systemMonitor@gnome-shell-extensions.gcampax.github.com', 'windowsNavigator@gnome-shell-extensions.gcampax.github.com', 'openweather-extension@jenslody.de', 'topIcons@adel.gadllah@gmail.com']"
dconf write /org/gnome/desktop/interface/clock-show-date true
dconf write /org/gnome/desktop/interface/clock-show-seconds true
dconf write /org/gnome/desktop/wm/preferences/resize-with-right-button true

# Themes
dconf write /org/gnome/desktop/wm/preferences/theme "'Adwaita-X-dark'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita'"
dconf write /org/gnome/desktop/interface/icon-theme "'Faenza-Ambiance'"

# Open weather
dconf write /org/gnome/shell/extensions/openweather/unit "'celsius'"
dconf write /org/gnome/shell/extensions/openweather/wind-speed-unit "'kph'"
dconf write /org/gnome/shell/extensions/openweather/city "'2174003>Brisbane (AU)'"
