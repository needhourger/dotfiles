-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "xwayland-video-bridge-fixes",
    match = { class = "xwaylandvideobridge" },

    no_initial_focus = true,
    no_focus = true,
    no_anim = true,
    no_blur = true,
    max_size = "1 1", -- todo: not sure
    opacity = 0.0,
})

-- Blueman
hl.window_rule({
    name = "blueman-fixes",
    match = { class = "blueman-manager" },

    float = true,
    center = true,
    max_size = { 600, 400 }
})

-- Satty for screenshot
hl.window_rule({
    name = "satty-fixes",
    match = { class = "com.gabm.satty" },

    float = true,
    center = true,
    max_size = { 800, 600}
})

-- Windows rules for feishu
hl.window_rule({
    name = "feishu-pictures",
    match = { title = "Picture" },
    
    float = true,
    center = true,
})

hl.window_rule({
    name = "feishu-chat",
    match = { title = "Chat between .*" },
    
    float = true,
    center = true
})

-- Window rules for linuxqq
hl.window_rule({
    name = "linuxqq-settings",
    match = { class = "QQ", title = "设置" },

    float = true,
    center = true
})

hl.window_rule({
    name = "linuxqq-picture",
    match = { class = "QQ", title = "图片查看器" },

    float = true,
    center = true
})

hl.window_rule({
    name = "linuxqq-chat-history",
    match = { class = "QQ", title = ".*的聊天记录"},
    
    float = true,
    center = true
})