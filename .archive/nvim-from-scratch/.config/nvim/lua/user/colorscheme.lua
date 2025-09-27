-- vim.cmd [[colorscheme default]]

local colorscheme = "gruvbox"
-- local colorscheme = "gruvbox-material"
-- vim.g.gruvbox_contrast_dark = "hard"
-- vim.cmd("let g:gruvbox_contrast_dark = 'soft'")

--[[ vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha ]]
--[[ require("catppuccin").setup() ]]
--[[ local colorscheme = "catppuccin" ]]

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
