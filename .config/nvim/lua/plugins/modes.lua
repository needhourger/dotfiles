return {
  "mvllow/modes.nvim",
  version = "v0.2.1",
  config = function()
    require("modes").setup()  
  end,
  cond = function() return not vim.g.vscode end
}
