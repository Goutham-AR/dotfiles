return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    { "<leader>dv", "<cmd>DiffviewOpen<cr>", desc = "Diff View" },
    { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
    { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close Diff" },
  },
}
