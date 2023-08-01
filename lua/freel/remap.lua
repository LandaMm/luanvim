

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- nvim-telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

vim.keymap.set('n', 'te', ':tabedit<CR>', { silent = true })

