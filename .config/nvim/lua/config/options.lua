local opt = vim.opt
local g = vim.g

opt.autoread = true
opt.background = 'dark'
opt.binary = true
opt.icon = true
opt.lisp = true
opt.mouse = 'a'
opt.smarttab = true
opt.smoothscroll = true
opt.softtabstop = 2
opt.spell = false
opt.swapfile = false
opt.syntax = 'on'
opt.filetype = 'on'
opt.fileformat = "unix"
opt.autochdir = true
opt.backupcopy = "auto"
opt.updatetime = 300

-- Fold
opt.foldenable = true
opt.foldmethod = "syntax"
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldclose = ""

-- Searching
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

-- UI
opt.number = true
opt.cursorline = true
opt.splitbelow = true
opt.splitright = true
opt.showmode = true
opt.linespace = 0
opt.bufhidden = 'hide'
opt.termguicolors = true
opt.ruler = true

-- Tab
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.cindent = true

-- clipboard
-- 1. 彻底关闭全局同步（防止 dd、x、c 影响系统）
vim.opt.clipboard = ""

-- 2. 依然显式指定 wl-clipboard 驱动
vim.g.clipboard = {
    name = 'wl-clipboard',
    copy = {
        ['+'] = 'wl-copy --type text/plain',
        ['*'] = 'wl-copy --type text/plain'
    },
    paste = {
        ['+'] = 'wl-paste --no-newline',
        ['*'] = 'wl-paste --no-newline'
    },
    cache_enabled = 1
}

-- 利用neovim事件机制仅在y， yank时同步到系统剪切板
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Only sync to system clipboard when yanking",
    callback = function()
        -- vim.v.event.operator == "y" 确保只有 yank 操作触发，dd/x/c 等操作会被过滤掉
        if vim.v.event.operator == "y" and vim.v.event.regname == "" then
            vim.fn.setreg("+", vim.v.event.regcontents)
        end
    end
})

-- 4. 粘贴优化：允许你在普通模式下直接通过 p 粘贴系统剪贴板的内容（可选）
-- 如果不加这一行，你在 Neovim 里按 p 只能粘贴 Neovim 内部复制的东西
vim.keymap.set('n', 'p', '"+p', {
    desc = 'Paste from system clipboard'
})
