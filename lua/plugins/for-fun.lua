return {
	{
		"tamton-aquib/duck.nvim",
		config = function()
			-- local options = { "🦆", "🦖", "🐤" }
			local duck = require("duck")
			vim.api.nvim_create_user_command("Trex", function(opts)
				if opts.args == "stop" then
					duck.cook_all()
				else
					duck.hatch("🦖")
				end
			end, { nargs = "?" })
		end,
	},
	{
		"folke/drop.nvim",
		event = "VimEnter",
		config = function()
			require("drop").setup({
				theme = "leaves",
				max = 20,
			})
		end,
	},
}
