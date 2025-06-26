-- Change the background color
local hl = vim.api.nvim_set_hl
local bg = { bg = "#1F1F1F" }
local statusline_active = { fg = "#CCCCCC", bg = "#181818" }
local statusline_inactive = { fg = "#CCCCCC", bg = "#181818" }

-- Set initial background colors
hl(0, "Normal", bg)
hl(0, "NormalFloat", bg)
hl(0, "SignColumn", bg)
hl(0, "FoldColumn", bg)
hl(0, "EndOfBuffer", bg)

-- Set initial statusline colors
hl(0, "StatusLine", statusline_active)
hl(0, "StatusLineNC", statusline_inactive)

vim.api.nvim_create_augroup("MyBgOverride", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "MyBgOverride",
	callback = function()
		-- Reapply background color
		hl(0, "Normal", bg)
		hl(0, "NormalFloat", bg)
		hl(0, "SignColumn", bg)
		hl(0, "FoldColumn", bg)
		hl(0, "EndOfBuffer", bg)

		-- Reapply statusline color
		hl(0, "StatusLine", statusline_active)
		hl(0, "StatusLineNC", statusline_inactive)
	end,
})

return {
	{
		"Mofiqul/vscode.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("vscode")
		end,
	},
}
