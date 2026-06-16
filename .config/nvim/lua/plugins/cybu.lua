return {
  "ghillb/cybu.nvim",
  branch = "main", -- timely updates
  -- branch = "v1.x", -- won't receive breaking changes
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }, -- optional for icon support
  keys = {
    { "K", "<Plug>(CybuPrev)", mode = "n", desc = "Cybu Prev" },
    { "J", "<Plug>(CybuNext)", mode = "n", desc = "Cybu Next" },
    { "<c-s-tab>", "<plug>(CybuLastusedPrev)", mode = { "n", "v" }, desc = "Cybu Last Used Prev" },
    { "<c-tab>", "<plug>(CybuLastusedNext)", mode = { "n", "v" }, desc = "Cybu Last Used Next" },
  },
  opts = {}, -- automatically calls require("cybu").setup()
}