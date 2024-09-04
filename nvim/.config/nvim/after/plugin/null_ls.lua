local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	ensure_installed = {
		"gofumpt",
		"goimports",
		"goimports-reviser",
		"markdownlint_cli2",
		"prettierd",
		"revive",
		"stylua",
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
	sources = {
		null_ls.builtins.diagnostics.haml_lint.with({
			env = { RUBYOPT = "-W0" },
			command = {
				"bundle",
				"exec",
				"haml-lint",
				"--auto-correct",
			},
		}),
		null_ls.builtins.diagnostics.markdownlint_cli2,
		null_ls.builtins.diagnostics.markuplint,
		null_ls.builtins.diagnostics.revive.with({
			args = {
				"--config",
				"revive.toml",
				"-formatter",
				"json",
				"./...",
			},
		}),
		null_ls.builtins.diagnostics.rubocop,
		null_ls.builtins.formatting.biome,
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"css",
				"scss",
				"less",
				"html",
				"vue",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
			},
		}),
		null_ls.builtins.formatting.rubocop,
		null_ls.builtins.formatting.stylua,
	},
})
