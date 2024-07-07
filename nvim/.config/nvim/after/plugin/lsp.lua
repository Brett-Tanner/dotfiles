local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp_zero.on_attach(function() end)

require("mason").setup({})
require("mason-lspconfig").setup({
	PATH = "prepend",
	ensure_installed = {
		"biome",
		"cssls",
		"emmet_language_server",
		"lua_ls",
		"marksman",
		"gopls",
		"rubocop",
		"stimulus_ls",
		"tailwindcss",
		"tsserver",
	},
	flags = {
		allow_incremental_sync = false,
		debounce_text_changes = 150,
	},
	handlers = {
		lsp_zero.default_setup,
		lspconfig.biome.setup({
			root_dir = lspconfig.util.root_pattern("biome.json", "biome.jsonc", ".git"),
		}),
		lspconfig.cssls.setup({
			settings = {
				css = {
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		}),
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		}),
		lspconfig.marksman.setup({}),
		lspconfig.gopls.setup({}),
		lspconfig.pyright.setup({}),
		lspconfig.rubocop.setup({
			command = { "rbenv", "exec", "rubocop", "--lsp" },
		}),
		lspconfig.rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		}),
		lspconfig.stimulus_ls.setup({}),
		lspconfig.tailwindcss.setup({
			experimental = {
				classRegex = {
					"%\\w+([^\\s]*)",
					"\\.([^\\.]*)",
					':class\\s*=>\\s*"([^"]*)',
					'class:\\s+"([^"]*)',
				},
			},
		}),
		lspconfig.tsserver.setup({}),
	},
})

local cmp = require("cmp")
require("lsp-zero").cmp_action()

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})

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
		null_ls.builtins.diagnostics.djlint,
		null_ls.builtins.diagnostics.haml_lint.with({
			env = { RUBYOPT = "-W0" },
			command = {
				"bundle",
				"exec",
				"haml-lint",
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
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.djlint,
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
