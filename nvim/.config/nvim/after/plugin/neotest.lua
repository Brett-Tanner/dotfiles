-- get neotest namespace (api call creates or returns namespace)
require("neotest").setup({
	adapters = {
		require("neotest-golang"),
		require("neotest-rust"),
	},
})
