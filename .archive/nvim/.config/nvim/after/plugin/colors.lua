function ApplyColorScheme(color)
	-- color = color or "rose-pine"
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

end

ApplyColorScheme()
