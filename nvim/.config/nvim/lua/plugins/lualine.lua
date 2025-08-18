return {

	{

		"nvim-lualine/lualine.nvim",

		config = function()
			require("lualine").setup({

				options = {

					theme = "catppuccin-mocha",

					section_separators = "",

					component_separators = "",
				},

				sections = {

					lualine_a = { "mode" },

					lualine_b = { "branch", "diagnostics" },

					lualine_c = { "filename" },

					lualine_x = { "" },

					lualine_y = { "location" },

					lualine_z = { "filetype" },
				},
			})
		end,
	},
}
