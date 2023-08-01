-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Post-install/update hook with neovim command
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- use("rebelot/kanagawa.nvim", { run = ":colorscheme kanagawa"})
	use("ellisonleao/gruvbox.nvim", { run = ":colorscheme gruvbox" })

	use 'numToStr/Comment.nvim' -- gc command to comment

	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'

	use 'kyazdani42/nvim-web-devicons' -- File icons

	use 'akinsho/nvim-bufferline.lua'
	use 'norcalli/nvim-colorizer.lua'

	use {
		"ray-x/lsp_signature.nvim",
	}

	use 'jose-elias-alvarez/null-ls.nvim'
	use 'MunifTanjim/prettier.nvim'

	use 'lewis6991/gitsigns.nvim'
	use 'dinhhuy258/git.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'nvimdev/lspsaga.nvim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

	use 'github/copilot.vim'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
end)
