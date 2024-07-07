local cmp = require("cmp")

cmp.setup({
	sources = cmp.config.sources({
		{ name = "lazydev", group_index = 0 },
	}),
})
