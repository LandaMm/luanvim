
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status, nvim_tree = pcall(require, 'nvim-tree')
if (not status) then return end

local function opts(desc)
	return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

nvim_tree.setup({
	on_attach = my_on_attach,
})

vim.keymap.set('n', '<leader>tt', require('nvim-tree.actions.tree.toggle').fn, opts('Toggle'))
vim.keymap.set('n', '<leader>tf', nvim_tree.focus, opts('Focus'))
vim.keymap.set('n', '<leader>tc', require('nvim-tree.view').close, opts('Close'))

