return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
  },
  config = function()
    local neogit = require("neogit")

    vim.keymap.set("n", "<leader>gs", neogit.open, { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", { silent = true, noremap = true })
  end,
}
