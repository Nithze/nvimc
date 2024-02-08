local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
vim.cmd('source ~/.config/nvim/purple-haze.vim')
vim.cmd('source ~/.config/nvim/wsl-clip.vim')



local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#0d0d0d" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#0d0d0d" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0d0d0d" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#0d0d0d" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#0d0d0d" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#0d0d0d" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#0d0d0d" })
end)

require("ibl").setup { indent = { highlight = highlight } }



-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = NONE,
  white  = '#ffffff',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#24283b',
  insert = '#00FFAB',
  visual = '#FFCA03',
  replace = '#FF008E',
  normal = '#4649FF',
  light = '#888da4'
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.white, bg = colors.normal },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.light, bg = colors.black },
	},

	insert = { a = { fg = colors.grey, bg = colors.insert } },
	visual = { a = { fg = colors.grey, bg = colors.visual } },
	replace = { a = { fg = colors.white, bg = colors.replace } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

local sections = {
	lualine_a = {
		{ "mode", separator = { left = "" }, right_padding = 0 },
	},
	lualine_b = {
		{
			"filename",
			shorting_target = 80,
			symbols = {
				modified = " ●", -- Text to show when the buffer is modified
				alternate_file = "#", -- Text to show to identify the alternate file
				directory = "", -- Text to show when the buffer is a directory
			},
		},
		"branch",
	},
	lualine_c = {
		{
			"filename",
			path = 3,
			file_status = false,
		},
	},
	lualine_x = { "fileformat" },
	lualine_y = { "filetype", "encoding" },
	lualine_z = {
		{ "location", separator = { right = "" }, left_padding = 2 },
	},
}

require("lualine").setup({
	options = {
		theme = bubbles_theme,
		component_separators = { left = "->", right = "<-" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			"NvimTree",
			"Trouble",
		},
	},
	sections = sections,
	inactive_sections = sections,
	tabline = {},
	extensions = {},
})
