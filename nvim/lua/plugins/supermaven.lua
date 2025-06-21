return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,

		opts = {
			accept_suggestion = "<Tab>",
		},
	},
}
