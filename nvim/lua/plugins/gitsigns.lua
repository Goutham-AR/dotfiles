return {
  "lewis6991/gitsigns.nvim",
  opts = {
    -- signs = {
    -- add = { text = "+" },
    -- change = { text = "~" },
    -- delete = { text = "_" },
    -- topdelete = { text = "‾" },
    -- changedelete = { text = "~" },
    -- },
  },
  config = function()
    require("gitsigns").setup()
    vim.keymap.set("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<CR>", { desc = "toggle git blame" })
    vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<CR>", { desc = "prev hunk" })
    vim.keymap.set("n", "c]", ":Gitsigns next_hunk<CR>", { desc = "next hunk" })
  end,
}
