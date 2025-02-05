return {
	"hrsh7th/cmp-buffer",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope-fzf-native.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvimtools/none-ls.nvim",
	"rebelot/kanagawa.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"tpope/vim-rails",
	"tpope/vim-bundler",
	{ "BurntSushi/ripgrep" },
	{ "L3MON4D3/LuaSnip" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{
		"Exafunction/codeium.vim",
		commit = "289eb72",
		event = "BufEnter",
	},
	{ "neovim/nvim-lspconfig" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "williamboman/mason.nvim" },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "fredrikaverpil/neotest-golang", version = "1.2.0" },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "MagicDuck/grug-far.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		commit = "80eb2d6719649ea597b4c14a98f66d38960fd89c",
	},
	{ "folke/which-key.nvim", event = "VimEnter" },
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Library items can be absolute paths
				-- "~/projects/my-awesome-lib",
				-- Or relative, which means they will be resolved as a plugin
				-- "LazyVim",
				-- When relative, you can also provide a path to the library in the plugin dir
				"luvit-meta/library", -- see below
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"mikesmithgh/kitty-scrollback.nvim",
		enabled = true,
		lazy = true,
		cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
		event = { "User KittyScrollbackLaunch" },
		version = "^5.0.0",
		config = function()
			require("kitty-scrollback").setup()
		end,
	},
	{ "Mofiqul/dracula.nvim" },
	{ "kamykn/spelunker.vim" },
	{ "echasnovski/mini.pairs", version = "*" },
	{ "windwp/nvim-ts-autotag" },
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {
			{
				dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
				-- minimum number of file buffers that need to be open to save
				-- Set to 0 to always save
				need = 1,
				branch = true, -- use git branch to save session
			},
		},
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
	},
	{ "brenoprata10/nvim-highlight-colors" },
}
