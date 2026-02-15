require("core.options")
require("core.autocmd")
require("core.keymaps")

vim.g.have_nerd_font = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
  require("plugins.fzf_lua"),
  require("plugins.autopairs"),
  require("plugins.autosession"),
  -- require("plugins.better"),
  require("plugins.betterescape"),
  require("plugins.blink"),
  require("plugins.conform"),
  require("plugins.gitsigns"),
  require("plugins.guessindent"),
  require("plugins.lazydev"),
  require("plugins.lsp"),
  require("plugins.mini"),
  require("plugins.neogit"),
  require("plugins.oil"),
  require("plugins.telescope"),
  require("plugins.theme"),
  require("plugins.tmuxnavigator"),
  require("plugins.todocomments"),
  require("plugins.treesitter"),
  require("plugins.undotree"),
  require("plugins.indent_guide"),
  require("plugins.copilot"),
  require("plugins.codecompanion"),
})
