-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- themes
  use { "folke/tokyonight.nvim" }

  --wakatime
  use 'wakatime/vim-wakatime'

  use { 'nvim-lualine/lualine.nvim',
	requires = { 'nvim-tree/nvim-web-devicons', opt = true },
	cond = [[not vim.g.vscode]] 
  }

  use  { 'neoclide/coc.nvim',
	branch = "release",
	cond = [[not vim.g.vscode]]
  }

  -- different color for different mode
  use { 'mvllow/modes.nvim',
	tag = 'v0.2.0',
	config = function()
		require('modes').setup({})
	end,
	cond = [[not vim.g.vscode]]
  }

  -- Status column
  use { 'luukvbaal/statuscol.nvim',
	config = function()
		require("statuscol").setup({
			setopt = true,
			thousands = true,
			relculright = true,

		})
	end,
	cond = [[not vim.g.vscode]]
  }

  -- Special Cursor moving animation
  use { 'gen740/SmoothCursor.nvim',
	config = function()
		require('smoothcursor').setup({
			type="default",
			fancy={
				enable = true,
			}
		})
	end,
	cond = [[not vim.g.vscode]]
  }

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
	cond = [[not vim.g.vscode]]
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
		local ts_update = requrie('nvim-treesitter.install').update({with_sync=true})
		ts_update()
	end,
  }

end)
