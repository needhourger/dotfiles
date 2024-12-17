return {
  "nvim-lualine/lualine.nvim",
  dependences = { "nvim-tree/nvim-web-devicons" },
  cond = function() return not vim.g.vscode end
}
