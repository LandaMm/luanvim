
require("gruvbox").setup({
	bold = true,
	italic = {
		strings = false,
		comments = true,
		folds = false
	},
	transparent_mode = true,
})

vim.o.background = 'dark'
vim.cmd("colorscheme gruvbox")

