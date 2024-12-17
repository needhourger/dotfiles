return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
       transparent = true,
    })
    vim.cmd("colorscheme cyberdream")
  end,
  cond = function() return not vim.g.vscode end
}
