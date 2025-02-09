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
  require("plugins.zenbone"),
  require("plugins.undotree"),
  require("plugins.oil"),
  require("plugins.lualine"),
  require("plugins.indent"),
  require("plugins.gitsigns"),
  require("plugins.fugitive"),
  require("plugins.vimux"),
  require("plugins.vim_sleuth"),
  require("plugins.bufferline"),
  require("plugins.autopairs"),
  require("plugins.vim_sandwich"),
  require("plugins.lsp"),
  require("plugins.cmp"),
  require("plugins.tmux_navigator"),
  require("plugins.fzf"),
  require("plugins.conform"),
})
