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
