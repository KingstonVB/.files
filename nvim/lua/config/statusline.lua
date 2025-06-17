vim.o.showmode = true

vim.o.statusline = "%= %f %r"

-- Change the background color
local hl = vim.api.nvim_set_hl
local bg = { bg = "#1F1F1F" }
hl(0, "Normal", bg)
hl(0, "NormalFloat", bg)
hl(0, "SignColumn", bg)
hl(0, "FoldColumn", bg)
hl(0, "EndOfBuffer", bg)

vim.api.nvim_create_augroup("MyBgOverride", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "MyBgOverride",
	callback = function()
		hl(0, "Normal", bg)
		hl(0, "NormalFloat", bg)
		hl(0, "SignColumn", bg)
		hl(0, "FoldColumn", bg)
		hl(0, "EndOfBuffer", bg)
	end,
})

-- Set the active status lines color
vim.api.nvim_set_hl(0, "StatusLine", {
	fg = "#CCCCCC", -- Text color
	bg = "#181818", -- Background color
})

-- Set the inactive status lines color
vim.api.nvim_set_hl(0, "StatusLineNC", {
	fg = "#908caa", -- Text color
	bg = "#2a273f", -- Background color
})

-- Change separator colors
vim.api.nvim_set_hl(0, "WinSeparator", {
	fg = "#191724",
	bg = "#191724",
})
