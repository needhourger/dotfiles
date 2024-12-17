return {
  "petertriho/nvim-scrollbar",
  config = function()
    local colors = require("cyberdream.colors")
    require("scrollbar").setup({
      handle = {
        color = colors.bgHighlight,
      },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      }
    })
  end,
  cond = function() return not vim.g.vscode end
}
