return {
	"tpope/vim-sleuth",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tpope/vim-surround",
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	{ "folke/which-key.nvim", opts = {} },

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},

	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	{
		"echasnovski/mini.indentscope",
		version = false,
		opts = {},
	},
}
