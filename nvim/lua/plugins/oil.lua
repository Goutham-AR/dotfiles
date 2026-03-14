return {
  "stevearc/oil.nvim",
  opts = {},
  lazy = false,
  config = function()
    require("oil").setup({
      columns = {
        "permissions",
        "size",
        "mtime",
      },
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["\\"] = { "actions.close", mode = "n" },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-r>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["<leader>cd"] = { "actions.cd", mode = "n" },
        ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["<leader>y"] = "actions.yank_entry",
      },
      use_default_keymaps = false,
    })
    vim.keymap.set("n", "\\", "<cmd>:Oil<CR>", { desc = "Open Oil" })
  end,
}
