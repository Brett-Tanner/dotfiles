require("brett.remap")

vim.bo.autoindent = true
vim.bo.smartindent = true
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.g.have_nerd_font = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.timeoutlen = 250
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.wrap = true

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

vim.treesitter.language.register("markdown", "mdx")

-- Stop vim-rails killing my syntax highlighting in yaml files
vim.api.nvim_create_autocmd("FileType", { pattern = "eruby.yaml", command = "set filetype=yaml" })

-- Run rustfmt on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.rs" },
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- Don't use codeium in Go while I'm learning
vim.api.nvim_create_autocmd("FileType", { pattern = "go", command = "Codeium Disable" })
