-- DMS user keybind overrides (edit via Control Center or dms; do not remove this header)

hl.unbind("ALT + CTRL + space")
hl.bind("ALT + CTRL + space", hl.dsp.exec_cmd('dms ipc call launcher openQuery ":e"'))
hl.unbind("SHIFT + ALT + 3")
hl.bind("SHIFT + ALT + 3", hl.dsp.exec_cmd("dms screenshot full"))
hl.unbind("SHIFT + ALT + 4")
hl.bind("SHIFT + ALT + 4", hl.dsp.exec_cmd("dms screenshot region"))
hl.unbind("SUPER + 0")
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = "10" }), { description = "focus workspace 10" })
hl.unbind("SUPER + S")
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.unbind("SUPER + SHIFT + 0")
hl.bind(
    "SUPER + SHIFT + 0",
    hl.dsp.window.move({ workspace = "10" }),
    { description = "move to workspace 10 (non-silent)" }
)
hl.unbind("SUPER + SHIFT + S")
hl.bind(
    "SUPER + SHIFT + S",
    hl.dsp.window.move({ workspace = "special:magic" }),
    { description = "move to workspace magic (non-silent)" }
)
hl.unbind("SHIFT + CTRL + escape")
hl.bind("SHIFT + CTRL + escape", hl.dsp.exec_cmd("gnome-system-monitor"))
hl.unbind("SUPER + CTRL + R")
hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/monitor-control reset"))
hl.unbind("SUPER + E")
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.unbind("SUPER + T")
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty --start-as=minimized"), { description = "kitty" })
