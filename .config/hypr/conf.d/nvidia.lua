---@module 'hl'
hl.env("LIBVA_DRIVER_NAME", "nvidia")

-- HW acceleration
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("GBM_BACKEND", "nvidia-drm")

-- Fix 'MESA-LOADER: failed to open nvidia' errors
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Fix electron apps
hl.config({
    cursor = {
        no_hardware_cursors = true
    }
})
