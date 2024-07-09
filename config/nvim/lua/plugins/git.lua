return {
	{ -- git integration
		"tpope/vim-fugitive",
		config = function()
			-- oil replaces netrw
			vim.api.nvim_create_user_command("Browse", function(args)
				vim.ui.open(args.args)
			end, {
				desc = "Enables using GBrowse without netrw",
				force = true,
				nargs = 1,
			})

			vim.keymap.set("n", "<leader>gb", "<cmd>GBrowse<CR>", { desc = "[G]ithub [B]rowse" })
			-- line range select in visual mode
			vim.keymap.set("x", "<leader>gb", ":'<'>GBrowse<CR>", { desc = "[G]ithub [B]rowse" })
		end,
		dependencies = { "tpope/vim-rhubarb" },
	},

	{ -- git line status signs in the gutter
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}
