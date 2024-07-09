return {
	{ -- Section navigation
		"stevearc/aerial.nvim",
		opts = function()
			return {
				layout = {
					default_direction = "prefer_left",
				},
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { desc = "Aerial next", buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { desc = "Aerial previous", buffer = bufnr })
					vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "[A]erial toggle" })
				end,
			}
		end,
	},

	{ -- file explorer
		"stevearc/oil.nvim",
		opts = function()
			return {
				vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Oil start" }),
			}
		end,
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
