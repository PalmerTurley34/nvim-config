return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "folke/neodev.nvim", opts = {} },

		{
			"williamboman/mason.nvim",
		},

		{
			"williamboman/mason-lspconfig.nvim",
		},
	},

	config = function()
		require("neodev").setup()
		require("mason").setup({
			ensure_installed = { "gopls", "lua_ls", "pyright" },
		})

		local servers = {
			gopls = {},
			pyright = {},

			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
					diagnostics = { disable = { "missing-fields" } },
				},
			},
		}

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Ensure the servers above are installed
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})
		local on_attach = function(_, bufnr)
			local nmap = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

			nmap("<leader>gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
			nmap("<leader>gr", vim.lsp.buf.references, "[G]oto [R]eferences")
			nmap("<leader>gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")

			nmap("<leader>gh", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			-- Lesser used LSP functionality
			nmap("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		end

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				})
			end,
		})

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "floating diagnostic message" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "previous diagnostic message" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic message" })
		vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "diagnostics list" })
	end,
}
