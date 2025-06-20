vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>")
-- vim.keymap.set("n", "<leader>q", "<cmd>:q<CR>")
-- vim.keymap.set("n", "<leader>e", "<cmd>:qa<CR>")
vim.keymap.set("i", "jk", "<Esc>")
-- vim.keymap.set("n", "<Tab>", "<cmd>:bn<CR>")
-- vim.keymap.set("n", "<S-Tab>", "<cmd>:bp<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>:bd<CR>")
vim.keymap.set("v", "<leader>c", ":norm gcc<CR>")
vim.keymap.set("n", "<leader>c", ":norm gcc<CR>")
vim.keymap.set("n", "<leader>v", "<cmd>:vsplit<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>:split<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "<leader>x", function()
-- local cmd = vim.fn.input("Run in tmux: ") -- Ask for user input
-- if cmd ~= "" then
-- vim.cmd("VimuxRunCommand('" .. cmd .. "')")
-- end
-- end, { desc = "Run custom command in Vimux" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
