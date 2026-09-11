-- DMS user keybind overrides (edit via Control Center or dms; do not remove this header)
hl.bind("ALT + CTRL + space", hl.dsp.exec_cmd("dms ipc call launcher openQuery \":e\""))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/monitor-control reset"))
hl.bind("SHIFT + CTRL + escape", hl.dsp.exec_cmd("gnome-system-monitor"))
-- Screenshots (copy the macos keybinds)
hl.bind("SHIFT + ALT + 3", hl.dsp.exec_cmd("dms screenshot full"))
hl.bind("SHIFT + ALT + 4", hl.dsp.exec_cmd("dms screenshot region"))

-- Special workspace (scratchpad)
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({
    workspace = "special:magic"
}))

hl.bind("SUPER + 0", hl.dsp.focus({
    workspace = "10"
}))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({
    workspace = "10"
}))
