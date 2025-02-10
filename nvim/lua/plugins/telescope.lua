return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      "nvim-telescope/telescope-fzf-native.nvim",

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = "make",

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "external",
          "dist",
          ".venv",
          "build",
          "out",
          "bin",
        },
      },
    })
    pcall(require("telescope").load_extension, "fzf")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>f", function()
      builtin.find_files({ cwd = vim.fn.getcwd() })
    end, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Find Help" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Find keymaps" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader>sb", builtin.builtin, { desc = "Find builtin" })
    vim.keymap.set("n", "<leader>.", function()
      builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
    end, { desc = "Find files in current  buffer directory" })
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })
  end,
}
