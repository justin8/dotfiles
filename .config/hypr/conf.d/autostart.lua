---@module 'hl'
-- ################
-- ## AUTOSTART ###
-- ################
hl.on("hyprland.start", function()
    hl.exec_cmd("sleep 2 && ~/.config/hypr/scripts/monitor-control reset")
    hl.exec_cmd("udiskie --automount --smart-tray")
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper-rotator &> ~/.swaybg.log")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("MoonDeckBuddy")
    hl.exec_cmd("easyeffects --gapplication-service")
    hl.exec_cmd("[workspace 1 silent] zen-browser")
    hl.exec_cmd(
        "[workspace 10 silent] flatpak 'run' '--command=/app/bin/chrome' 'com.google.Chrome' '--profile-directory=Default' '--app-id=cinhimbnkkaeohfgghhklpknlkffjgod'")
    hl.exec_cmd("[workspace 2 silent] env PATH=/usr/bin:/bin:$PATH steam -nochatui -nofriendsui -silent")
    hl.exec_cmd("[workspace special:magic silent] obsidian")
    hl.exec_cmd("xrandr --output DP-1 --primary")
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user start hyprland-session.target")
end)

hl.on("hyprland.shutdown", function()
    hl.exec_cmd("systemctl --user stop hyprland-session.target")
end)
