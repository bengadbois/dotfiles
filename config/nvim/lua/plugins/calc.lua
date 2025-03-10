return {
	{ -- qalc integration
		"Apeiros-46B/qalc.nvim",
		config = function()
			require("qalc").setup({})
			vim.keymap.set("n", "<leader>q", "<cmd>Qalc<CR>", { desc = "Start Qalculate" })
		end,
	},
}
