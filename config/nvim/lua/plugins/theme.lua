return {
	{ -- Theme
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				integrations = {
					aerial = true,
					which_key = true,
				},
				flavour = "macchiato",
				transparent_background = true,
			})

			vim.api.nvim_command("colorscheme catppuccin-mocha")
		end,
	},
}
