-- buffer switching
vim.keymap.set("n", "<tab>", "<cmd>:bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<s-tab>", "<cmd>:bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>:bd<CR>", { desc = "[B]uffer [D]elete" })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Cancel search" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

function insertFullPath()
	local filepath = vim.fn.expand("%")
	vim.fn.setreg("+", filepath)
end
vim.keymap.set("n", "<leader>fp", insertFullPath, { desc = "[F]ile [P]ath to clipboard", noremap = true })
