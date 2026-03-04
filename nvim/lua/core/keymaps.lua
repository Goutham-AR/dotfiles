vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>")
vim.keymap.set("i", "jk", "<Esc>")
-- Terminal mode escape
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set("n", "<C-e>", "<cmd>:bd<CR>")
vim.keymap.set("v", "<leader>c", ":norm gcc<CR>")
vim.keymap.set("n", "<leader>c", ":norm gcc<CR>")
vim.keymap.set("n", "<leader>v", "<cmd>:vsplit<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>:split<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set('n', '<leader><leader>', ':\\<C-u>!')

-- Native undo navigation (replaces undotree)
vim.keymap.set("n", "g-", "<cmd>undo<CR>", { desc = "Undo" })
vim.keymap.set("n", "g+", "<cmd>redo<CR>", { desc = "Redo" })
vim.keymap.set("n", "<leader>u", "<cmd>undolist<CR>", { desc = "Show undo list" })

-- Search TODO/FIXME/HACK (replaces todo-comments)
vim.keymap.set("n", "<leader>ft", function()
  require("fzf-lua").grep({ search = "TODO\\|FIXME\\|HACK\\|NOTE" })
end, { desc = "[F]ind [T]ODOs" })
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
