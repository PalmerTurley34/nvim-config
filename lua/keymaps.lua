vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>y", '"*y')
vim.keymap.set("n", "<leader>Y", '"*Y')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set("i", "<C-i>", "<Esc>")

vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "Write/Save File" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit/Close File" })

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- document existing key chains
require("which-key").register({
	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
	["<leader>f"] = { name = "[F]ile", _ = "which_key_ignore" },
	["<leader>d"] = { name = "[D]ebug/[D]iagnostics", _ = "which_key_ignore" },
	["<leader>g"] = { name = "[G]oto", _ = "which_key_ignore" },
	["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
	["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
	["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
	["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
	-- ["<leader>w"] = { name = "[W]indow", _ = "which_key_ignore" },
})
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require("which-key").register({
	["<leader>"] = { name = "VISUAL <leader>" },
	["<leader>h"] = { "Git [H]unk" },
}, { mode = "v" })
