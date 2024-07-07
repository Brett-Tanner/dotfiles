require("lualine").setup({
	extensions = { "oil" },
	options = {
		globalstatus = true,
		theme = "auto",
	},
	winbar = {
		lualine_a = { { "filename", path = 1 } },
	},

	inactive_winbar = {
		lualine_a = { { "filename", path = 1 } },
	},
})
