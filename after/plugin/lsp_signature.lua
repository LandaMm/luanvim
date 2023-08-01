
local status, lsp_signature = pcall(require, 'lsp_signature')
if (not status) then return end

lsp_signature.setup({})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-k>', lsp_signature.toggle_float_win, opts)

