require("mini.files").setup({
	use_as_default_explorer = true,
})

vim.keymap.set("n", "<leader>e", function()
	MiniFiles.open()
end, { silent = true })
