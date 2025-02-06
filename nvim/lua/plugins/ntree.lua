return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
	},
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
			},
			window = {
                position = "current",
				mappings = {
					["\\"] = "close_window",
				},
			},
            hijack_netrw_behaviour = "open_current",
		},
	},
}
