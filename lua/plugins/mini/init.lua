require("mini.ai").setup()
require("mini.align").setup()

require("mini.indentscope").setup({
	symbol = "│",
	draw = {
		animation = require("mini.indentscope").gen_animation.none(),
	},
})

require("mini.pairs").setup()
require("mini.surround").setup()

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "┃", change = "┃", delete = "┃" },
	},
})

require("mini.splitjoin").setup({
	mappings = {
		toggle = "<leader>m",
	},
})

require("plugins.mini.picker")
require("plugins.mini.notify")
require("plugins.mini.files")
require("plugins.mini.statusline")
require("plugins.mini.completions")
