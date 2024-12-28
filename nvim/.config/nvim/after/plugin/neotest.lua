local config = {
	runner = "gotestsum",
}
require("neotest").setup({
	adapters = {
		require("neotest-golang")(config),
	},
})
