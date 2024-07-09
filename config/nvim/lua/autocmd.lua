vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.yaml.template",
	desc = "Read .yaml.template files as .yaml for highlighting",
	group = vim.api.nvim_create_augroup("template-files", { clear = true }),
	callback = function()
		vim.bo.filetype = "yaml"
	end,
})
