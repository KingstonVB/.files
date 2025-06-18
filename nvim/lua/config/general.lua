vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.inccommand = "split"

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

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
