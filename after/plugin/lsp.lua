local lsp_zero = require('lsp-zero').preset({})
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	sources = {{name = 'nvim_lsp'}},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})

require("lspconfig").tsserver.setup({
	capabilities = lsp_capabilities,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })

			-- format on save
			vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
			vim.api.nvim_create_autocmd(event, {
				buffer = bufnr,
				group = group,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr, async = async })
				end,
				desc = "[lsp] format on save",
			})
		end

		if client.supports_method("textDocument/rangeFormatting") then
			vim.keymap.set("x", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })
		end

		lsp_zero.default_keymaps({buffer = bufnr})
	end,
})

lsp_zero.setup()

