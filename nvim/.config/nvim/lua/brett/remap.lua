-- General
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil, { desc = "Exit to containing directory", remap = true })
vim.keymap.set("n", "<leader>t", vim.cmd.tabedit, { desc = "New Tab", remap = true })
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose, { desc = "Close Tab", remap = true })
vim.keymap.set("n", "<Left>", "<Nop>", { desc = "Disable left arrow", remap = true })
vim.keymap.set("n", "<Right>", "<Nop>", { desc = "Disable right arrow", remap = true })
vim.keymap.set("n", "<Up>", "<Nop>", { desc = "Disable up arrow", remap = true })
vim.keymap.set("n", "<Down>", "<Nop>", { desc = "Disable down arrow", remap = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight", remap = true })

-- Linting
vim.keymap.set(
	"n",
	"<leader>bf",
	"<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000, filter = function(client) return client.name ~= 'tsserver' end })<CR>",
	{ desc = "Format buffer", remap = true }
)

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float, { desc = "Show line diagnostics", remap = true })

-- Split windows
vim.keymap.set("n", "<leader>-", "<C-W>s<C-W>j", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v<C-W>l", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>vt", "<cmd>vsplit | terminal<CR>", { desc = "Split terminal right", remap = true })

-- Switch windows
vim.keymap.set("n", "<C-h>", "<C-W>h", { desc = "Switch to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-W>j", { desc = "Switch to below window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-W>k", { desc = "Switch to above window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-W>l", { desc = "Switch to right window", remap = true })

-- nvim-rails
vim.keymap.set("n", "<leader>rn", vim.cmd.Runner, { desc = "Run current Rails file", remap = true })

-- neotest
vim.keymap.set("n", "<leader>nt", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Test current file", remap = true })
vim.keymap.set("n", "<leader>nf", function()
	require("neotest").run.run()
end, { desc = "Test nearest function", remap = true })
vim.keymap.set("n", "<leader>nw", function()
	require("neotest").watch.watch(vim.fn.expand("%"))
end, { desc = "Test watch current file", remap = true })
vim.keymap.set("n", "<leader>ns", function()
	require("neotest").watch.stop(vim.fn.expand("%"))
end, { desc = "Stop test watch", remap = true })
vim.keymap.set("n", "<leader>no", function()
	require("neotest").output.open()
end, { desc = "Open test output", remap = true })

-- codeium
vim.keymap.set("n", "<leader>ce", function()
	vim.cmd("CodeiumEnable")
end, { desc = "Enable codeium", remap = true })

vim.keymap.set("n", "<leader>cd", function()
	vim.cmd("CodeiumDisable")
end, { desc = "Disable codeium", remap = true })

-- grug-far
vim.keymap.set("n", "<leader>rg", vim.cmd.GrugFar, { desc = "Open grug-far", remap = true })

-- lspconfig
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition", remap = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references", remap = true })
vim.keymap.set("n", "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename", remap = true })

-- colorschemes

vim.keymap.set(
	"n",
	"<leader>cs",
	"<cmd>lua Select_random_colorscheme()<cr>",
	{ desc = "Select random colorscheme", remap = true }
)

-- fugitive (git)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status", remap = true })

-- spelunker
vim.keymap.set("n", "[s", "<Plug>(spelunker-jump-prev)", { desc = "Previous misspelled word", remap = true })
vim.keymap.set("n", "]s", "<Plug>(spelunker-jump-next)", { desc = "Next misspelled word", remap = true })

-- persistence
vim.keymap.set("n", "<leader>qs", function()
	require("persistence").load()
end, { desc = "Load the session for the current directory", remap = true })
vim.keymap.set("n", "<leader>qS", function()
	require("persistence").select()
end, { desc = "Select a session to load", remap = true })
vim.keymap.set("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end, { desc = "Load the last session", remap = true })
vim.keymap.set("n", "<leader>qd", function()
	require("persistence").stop()
end, { desc = "Stop Persistence", remap = true })

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode", remap = true })
vim.keymap.set("t", "<C-v><Esc>", "<Esc>", { desc = "Pass <Esc> to terminal", remap = true })
