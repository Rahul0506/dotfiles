vim.api.nvim_create_user_command("ColorLight", function()
	vim.cmd([[ colorscheme kanagawa-wave ]])
end, {})

vim.api.nvim_create_user_command("ColorDark", function()
	vim.cmd([[ colorscheme kanagawa-dragon ]])
end, {})
