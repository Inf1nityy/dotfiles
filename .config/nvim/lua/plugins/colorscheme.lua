function ColorMyPencils(color)
	color = color or "base16-black-metal-gorgoroth"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    'RRethy/base16-nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
        ColorMyPencils("base16-black-metal-gorgoroth")
    end
}
