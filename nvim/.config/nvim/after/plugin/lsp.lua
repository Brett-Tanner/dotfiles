local lsp_zero = require("lsp-zero")
local lsp_attach = function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end
lsp_zero.extend_lspconfig({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	lsp_attach = lsp_attach,
	float_border = "rounded",
	sign_text = true,
})

local lspconfig = require("lspconfig")
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
	},
	flags = {
		allow_incremental_sync = false,
		debounce_text_changes = 150,
	},
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({})
		end,
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
		lspconfig.rubocop.setup({
			command = { "rbenv", "exec", "rubocop", "--lsp" },
		}),
		lspconfig.svelte.setup({}),
	},
})
