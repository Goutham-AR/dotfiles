return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
    require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true,
        },
        keymaps = {
            ["\\"] = { "actions.close", mode = "n" },
        }
    })
    vim.keymap.set("n", "\\", "<cmd>:Oil<CR>", { desc = "Open Oil" })
  end
}
