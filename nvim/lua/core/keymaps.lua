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
vim.keymap.set('n', '<leader><leader>', ':\\<C-u>!')
vim.keymap.set("n", "<space>e", function()
  vim.ui.input({}, function(c) 
      if c and c~="" then 
        vim.cmd("noswapfile vnew") 
        vim.bo.buftype = "nofile"
        vim.bo.bufhidden = "wipe"
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c))
      end 
  end) 
end)
-- <leader>y will copy the current selection to the system clipboard
-- vim.keymap.set({ "v", "n" }, "<leader>y", [["+y]], { desc = "Copy selection to system clipboard" })
-- <leader>p will paste from the system clipboard
-- vim.keymap.set("v", "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
-- vim.keymap.set({"v", "n"}, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })

