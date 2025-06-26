-- Copyright (c) 2020-2021 Mofiqul Islam
-- MIT license, see LICENSE for more details.
local config = require("vscode.config")
local vscode = {}
local colors = {}

colors.inactive = "#666666"
colors.bg = "#181818"
colors.fg = "#CCCCCC"
colors.red = "#F14C4C"
colors.green = "#73C991"
colors.blue = "#0078D4"
colors.yellow = "#E2C08D"
colors.purple = "#B180D7"

vscode.normal = {
	a = { fg = colors.fg, bg = colors.bg },

	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
	z = { fg = colors.fg, bg = colors.bg },
}

vscode.visual = {
	a = { fg = colors.purple, bg = colors.bg },

	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
	z = { fg = colors.fg, bg = colors.bg },
}

vscode.inactive = {
	a = { fg = colors.fg, bg = colors.bg },

	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
	z = { fg = colors.fg, bg = colors.bg },
}

vscode.replace = {
	a = { fg = colors.red, bg = colors.bg },

	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
	z = { fg = colors.fg, bg = colors.bg },
}

vscode.insert = {
	a = { fg = colors.green, bg = colors.bg },

	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
	z = { fg = colors.fg, bg = colors.bg },
}

vscode.terminal = {
	a = { fg = colors.fg, bg = colors.bg },

	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
	z = { fg = colors.fg, bg = colors.bg },
}

vscode.command = {
	a = { fg = colors.yellow, bg = colors.bg },

	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
	z = { fg = colors.fg, bg = colors.bg },
}

return vscode
