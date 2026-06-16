-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Amber")

-- Input method support (e.g. fcitx5)
hl.env("QT_IM_MODULES", "wayland;fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("GLFW_IM_MODULE", "ibus")

-- Default editor
hl.env("EDITOR", "nvim")

-- gtk
hl.env("GTK_THEME","Adwaita:dark gnome-calculator")
-- Qt
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")