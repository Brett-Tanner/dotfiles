require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"markdown",
		"javascript",
		"json",
		"ruby",
		"rust",
		"toml",
		"typescript",
		"lua",
		"query",
		"vim",
		"vimdoc",
		"yaml",
	},
	sync_install = false,
	ignore_install = {},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

local parsers = require("nvim-treesitter.parsers")
local parser_config = parsers.get_parser_configs()
parser_config.htmldjango.filetype_to_parsername = "html"
