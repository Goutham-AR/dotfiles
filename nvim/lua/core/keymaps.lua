vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<Tab>", "<cmd>:bn<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>:bp<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>:bd<CR>")
vim.keymap.set("v", "<leader>c", ":norm gcc<CR>")
vim.keymap.set("n", "<leader>c", ":norm gcc<CR>")
vim.keymap.set("n", "<leader>v", "<cmd>:vsplit<CR>")
vim.keymap.set("n", "<leader>x", function()
  local cmd = vim.fn.input("Run in tmux: ") -- Ask for user input
  if cmd ~= "" then
    vim.cmd("VimuxRunCommand('" .. cmd .. "')")
  end
end, { desc = "Run custom command in Vimux" })
