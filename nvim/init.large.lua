require("core.options")
require("core.autocmd")
require("core.keymaps")
-- ==========================================================================
-- MINIMAL INIT.LUA FOR MASSIVE CODEBASES
-- ==========================================================================

-- 1. FAST FILE NAVIGATION (Built-in)
-- 'path' allows :find to search recursively. ** searches subdirectories.
-- 'wildignore' keeps the search fast by skipping junk.
vim.opt.path = { "**" }
vim.opt.wildignore:append({ "*/node_modules/*", "*/.git/*", "*/build/*", "*/out/*" })
vim.opt.wildmenu = true -- Visual autocomplete for command menu
vim.opt.wildmode = "longest:full,full"

-- 2. PERFORMANCE OPTIMIZATIONS
vim.opt.lazyredraw = true -- Don't redraw screen during macros/scripts
vim.opt.updatetime = 250 -- Faster response time
vim.opt.swapfile = false -- Disable swap files (prevents disk lag on huge files)
vim.opt.undofile = true -- Keep undo history in a file instead of memory
vim.opt.synmaxcol = 200 -- Don't highlight long lines (saves CPU)

-- 3. SEARCH & JUMPING
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase is used
vim.opt.incsearch = true -- Show matches as you type
vim.opt.grepprg = "grep -nHiR" -- Use system grep for :grep command
--
-- 1. SET RIPGREP AS THE GREP EXECUTABLE
-- --vimgrep: ensures the output is in the 'file:line:col:text' format Neovim expects
-- --smart-case: searches case-insensitively unless you use an uppercase letter
-- --follow: follow symbolic links
if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep --smart-case --follow"
    vim.opt.grepformat = "%f:%l:%c:%m"
end

-- 2. CREATE A SHORTCUT FOR SEARCHING
-- This allows you to type :RG <search_term> instead of :grep
vim.api.nvim_create_user_command("RG", function(opts)
    -- This runs grep and then automatically opens the quickfix window
    vim.cmd("silent grep! " .. opts.args)
    vim.cmd("copen")
    -- Focus back on the search results
    vim.cmd("wincmd p")
end, { nargs = 1 })

-- 3. KEYMAP FOR THE NEW COMMAND
vim.keymap.set("n", "<leader>g", ":RG ", { desc = "Ripgrep across project" })

-- 4. ESSENTIAL SHORTCUTS (No Plugins Needed)
local keymap = vim.keymap.set

-- Fast file finding
keymap("n", "<leader>f", ":find ", { desc = "Find file in path" })
vim.keymap.set("n", "<leader>F", ":find <cfile><CR>", { desc = "Find File Under Cursor" })

-- Buffer management (much faster than a tab bar plugin)
keymap("n", "<leader>b", ":ls<CR>:b ", { desc = "List and switch buffers" })
keymap("n", "[b", ":bprevious<CR>", { desc = "Prev buffer" })
keymap("n", "]b", ":bnext<CR>", { desc = "Next buffer" })

-- Quickfix list navigation (for :grep results)
keymap("n", "<leader>qo", ":copen<CR>", { desc = "Open Quickfix" })
keymap("n", "[q", ":cprev<CR>", { desc = "Prev result" })
keymap("n", "]q", ":cnext<CR>", { desc = "Next result" })

-- 5. AUTO-COMMANDS FOR HUGE FILES
-- Automatically disable syntax highlighting and line numbers for files > 1MB
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*",
  callback = function()
    local size = vim.fn.getfsize(vim.fn.expand("%:p"))
    if size > 1000000 then
      vim.opt_local.syntax = "off"
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.undoreload = 0
    end
  end,
})


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
  require("plugins.bufferline"),
  require("plugins.byebye"),
  require("plugins.autosession"),
  require("plugins.compile_mode"),
  require("plugins.context"),
  require("plugins.autopairs"),
  require("plugins.oil"),
  require("plugins.theme"),
  require("plugins.tmuxnavigator"),
  require("plugins.guessindent"),
  require("plugins.indent_guide"),
  require("plugins.flash"),
  require("plugins.lualine"),
  require("plugins.undotree"),
})
