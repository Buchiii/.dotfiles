return {
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal
		-- btop
		local btop = Terminal:new({ cmd = "btop", hidden = true })
		function _BTOP_TOGGLE()
			btop:toggle()
		end
		-- python
		local python = Terminal:new({ cmd = "python", hidden = true })
		function _PYTHON_TOGGLE()
			python:toggle()
		end
	end,
}
