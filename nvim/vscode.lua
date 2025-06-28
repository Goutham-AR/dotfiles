vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamedplus"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true

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

