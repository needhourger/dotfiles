return {
  'gen740/SmoothCursor.nvim',
  config = function()
    require('smoothcursor').setup({
      fancy = { enable = true }
    })
  end,
  cond = function() return not vim.g.vscode end
}
