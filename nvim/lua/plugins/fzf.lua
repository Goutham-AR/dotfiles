return {
  "ibhagwan/fzf-lua",
  event = "VimEnter",
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      defaults = {
        file_icons = false,
        git_icons = false,
      },
    })
    -- vim.keymap.set("n", "<leader>f", function()
      -- fzf.files({ cwd = vim.fn.getcwd() })
    -- end, { desc = "Find Files" })
    -- vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep" })
    -- vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = "Find Buffers" })
    -- vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Find Help" })
    -- vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Find keymaps" })
    -- vim.keymap.set("n", "<leader>.", function()
      -- fzf.files({ cwd = vim.fn.expand("%:p:h") })
    -- end, { desc = "Find files in current  buffer directory" })
  end,
}
