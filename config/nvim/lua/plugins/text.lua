return {
	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- Commenting code
		"numToStr/Comment.nvim",
		opts = {},
	},

	{ -- Do diffs within the same file
		"AndrewRadev/linediff.vim",
	},

	{ -- Restore last edit position
		"farmergreg/vim-lastplace",
	},
}
