vim.o.showmode = true

vim.o.statusline = "%= %f %r"

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
