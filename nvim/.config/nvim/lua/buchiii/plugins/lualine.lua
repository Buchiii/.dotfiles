return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_x = {
					{
						color = { fg = "#ff9e64" },
					},
					{
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = { "encoding", "filetype", "progress" },
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
