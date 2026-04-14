return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",

      build = "make",

      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Compatibility shims for removed nvim-treesitter APIs
    local ok, parsers = pcall(require, "nvim-treesitter.parsers")
    if ok and parsers and not parsers.ft_to_lang then
      parsers.ft_to_lang = function(ft)
        return vim.treesitter.language.get_lang(ft) or ft
      end
    end
    -- nvim-treesitter.configs was removed; inject a shim so telescope doesn't crash
    if not package.loaded["nvim-treesitter.configs"] then
      package.loaded["nvim-treesitter.configs"] = {
        is_enabled = function(_, _, _)
          return false
        end,
      }
    end

    require("telescope").setup({
      defaults = require("telescope.themes").get_ivy({
        layout_strategies = "horizontal",
        layout_config = {
          height = 0.50,
        },
        preview = {
          treesitter = false,
        },
        file_ignore_patterns = {
          "node_modules",
          "external",
          "dist",
          ".venv",
          "build",
          "out",
          "bin",
          ".cache",
          "^.git/",
          ".next",
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      }),
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")
    -- vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    -- vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>f", function () builtin.find_files({ hidden = true, no_ignore = true }) end , { desc = "[S]earch [F]iles" })
    -- vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    -- vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    -- vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    -- vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    -- vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    -- vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    -- vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "[ ] Find existing buffers" })
    -- vim.keymap.set("n", "<leader>.", function()
      -- builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
    -- end, { desc = "Find files in current  buffer directory" })

    -- vim.keymap.set("n", "<leader>/", function()
      -- builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        -- winblend = 10,
        -- previewer = false,
      -- }))
    -- end, { desc = "[/] Fuzzily search in current buffer" })

    -- vim.keymap.set("n", "<leader>s/", function()
      -- builtin.live_grep({
        -- grep_open_files = true,
        -- prompt_title = "Live Grep in Open Files",
      -- })
    -- end, { desc = "[S]earch [/] in Open Files" })

    -- vim.keymap.set("n", "<leader>sn", function()
      -- builtin.find_files({ cwd = vim.fn.stdpath("config") })
    -- end, { desc = "[S]earch [N]eovim files" })
  end,
}
