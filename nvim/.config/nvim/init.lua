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
function Light_or_dark()
	local time = os.date("*t")
	local dark = {
		"catppuccin-macchiato",
		"dracula",
		"dracula-soft",
		"everforest",
		"gruvbox-material",
		"kanagawa-dragon",
		"kanagawa-wave",
		"nord",
		"rose-pine-main",
		"tokyonight-night",
		"tokyonight-moon",
	}
	local light = {
		"catppuccin-frappe",
		"catppuccin-latte",
		"everforest",
		"gruvbox-material",
		"kanagawa-lotus",
		"rose-pine-dawn",
		"rose-pine-moon",
		"tokyonight-day",
		"tokyonight-storm",
	}
	if time.hour < 10 or time.hour > 16 then
		vim.cmd("set background=dark")
		return dark
	else
		vim.cmd("set background=light")
		return light
	end
end

function Select_random_colorscheme()
	local colorschemes = Light_or_dark()
	local random_index = math.random(1, #colorschemes)
	local random_colorscheme = colorschemes[random_index]
	vim.cmd("colorscheme " .. random_colorscheme)
	vim.notify("Applied colorscheme: " .. random_colorscheme)
end

Select_random_colorscheme()
