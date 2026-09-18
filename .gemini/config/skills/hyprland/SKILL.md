---
name: hyprland
description: >-
  Provides comprehensive knowledge, procedures, and official wiki documentation
  for configuring Hyprland and Hypr ecosystem tools. Use whenever tasks relate to
  Hyprland, hypr, window rules, workspace rules, layer rules, animations, keybinds,
  monitors, dispatchers, or hyprland.lua / hyprland.conf configurations.
---

# Hyprland Configuration & Knowledge Base Skill

This skill provides access to the official [Hyprland Wiki](https://github.com/hyprwm/hyprland-wiki) knowledge base and established procedures for configuring, inspecting, and troubleshooting Hyprland.

---

## 1. Knowledge Base Navigation

The upstream wiki documentation is mirrored locally under `references/wiki/content/` (auto-cloned on first run by `lookup.sh` or `update-wiki.sh`).

### Key Reference Files

Category | Wiki Path
:--- | :---
**Window Rules** | `references/wiki/content/configuring/core/rules/window-rules.md`
**Workspace Rules** | `references/wiki/content/configuring/core/rules/workspace-rules.md`
**Layer Rules** | `references/wiki/content/configuring/core/rules/layer-rules.md`
**All Config Options** | `references/wiki/content/configuring/core/config-options.md`
**Dispatchers** | `references/wiki/content/configuring/core/dispatchers.md`
**Binds & Submaps** | `references/wiki/content/configuring/core/binds/`
**Monitors** | `references/wiki/content/configuring/core/monitors/`
**Animations** | `references/wiki/content/configuring/core/animations.md`
**Lua Utilities** | `references/wiki/content/configuring/core/advanced-configuration/lua-utilities.md`
**Using Hyprctl** | `references/wiki/content/configuring/core/advanced-configuration/using-hyprctl.md`
**Layouts** | `references/wiki/content/configuring/layouts/`
**Useful Utilities** | `references/wiki/content/useful-utilities/`

### Searching the Knowledge Base

You can search the local wiki at any time using the lookup script:

```bash
# General search:
~/.gemini/config/skills/hyprland/scripts/lookup.sh "<term>"

# Scoped search in a subcategory:
~/.gemini/config/skills/hyprland/scripts/lookup.sh "fullscreen" "configuring/core/rules"
```

### Keeping Knowledge Base Up to Date

To pull the latest documentation from upstream `https://github.com/hyprwm/hyprland-wiki`:

```bash
~/.gemini/config/skills/hyprland/scripts/update-wiki.sh
```

---

## 2. Configuration Paradigms

Hyprland supports two primary configuration formats. Always inspect existing user files to match their active pattern.

### Modern Lua API (`hl.*`)
Hyprland v0.50+ features native Lua configuration. Common constructs:
- **Window Rules**:
  ```lua
  hl.window_rule({
      name = "my-rule", -- Named rules are evaluated before anonymous ones
      match = {
          class = "^(steam)$",
          fullscreen = true,
      },
      workspace = 3,
  })
  ```
- **Binds**:
  ```lua
  hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))
  hl.bind("SUPER + Q", hl.dsp.window.close())
  ```
- **Layer Rules**:
  ```lua
  hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
  ```
- **Config Options**:
  ```lua
  hl.config({
      general = {
          gaps_in = 5,
          gaps_out = 10,
      },
  })
  ```

### Classic Syntax (`hyprland.conf`)
- Window rules: `windowrulev2 = workspace 3, class:^(steam)$`
- Binds: `bind = SUPER, T, exec, kitty`
- Layer rules: `layerrule = blur, waybar`

---

## 3. Workflow for Making Changes

When asked to modify Hyprland settings or rules:

1. **Query Knowledge Base**: If unsure about specific rule properties, matcher names, dispatcher arguments, or option paths, check the corresponding wiki file under `references/wiki/content/` or run `lookup.sh`.
2. **Inspect Current State**:
   - `hyprctl clients` — Check exact window class, title, initialClass, initialTitle, and fullscreen state.
   - `hyprctl monitors` — Check active monitor names, resolutions, and scaling.
   - `hyprctl workspaces` — View active workspaces and current monitor assignments.
3. **Edit Configurations**: Make targeted edits preserving user conventions and formatting.
4. **Reload & Validate**:
   ```bash
   hyprctl reload config-only
   hyprctl configerrors
   ```
   Ensure `hyprctl configerrors` returns empty/no errors.
5. **Version Control**: Dotfiles are tracked using `yadm`. Always use `yadm` commands (`yadm status`, `yadm diff`, `yadm add`, `yadm log`, etc.) instead of plain `git`. Review status and diffs with `yadm status` and `yadm diff` after editing.
