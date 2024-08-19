require("brett")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- Rust tools setup
local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

-- Color scheme
function Select_random_colorscheme()
	local colorschemes = {
		"catppuccin-macchiato",
		"dracula",
		"dracula-soft",
		"kanagawa-dragon",
		"kanagawa-wave",
		"rose-pine-main",
		"tokyonight-night",
		"tokyonight-moon",
	}

	local random_index = math.random(1, #colorschemes)
	local random_colorscheme = colorschemes[random_index]
	vim.cmd("colorscheme " .. random_colorscheme)
	vim.notify("Applied colorscheme: " .. random_colorscheme)
end

Select_random_colorscheme()
