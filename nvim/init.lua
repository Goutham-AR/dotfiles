require("core.options")
require("core.keymaps")
require("core.autocmd")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require("plugins.flash"),
  require("plugins.nvim_router"),
  require("plugins.neogit"),
  require("plugins.neorg"),
  require("plugins.autosession"),
  require("plugins.hex"),
  require("plugins.gruvbox"),
  require("plugins.telescope"),
  require("plugins.fzf"),
  require("plugins.treesitter"),
  require("plugins.undotree"),
  require("plugins.oil"),
  require("plugins.lualine"),
  require("plugins.indent"),
  require("plugins.diffview"),
  require("plugins.gitsigns"),
  require("plugins.vim_sleuth"),
  require("plugins.autopairs"),
  require("plugins.vim_sandwich"),
  require("plugins.lsp"),
  require("plugins.blink"),
  require("plugins.lazydev"),
  require("plugins.tmux_navigator"),
  require("plugins.conform"),
  require("plugins.metal"),
  require("plugins.todo"),
})
