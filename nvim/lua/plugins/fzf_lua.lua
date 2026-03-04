return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- Default configuration
  },
  config = function()
    local fzf = require("fzf-lua")

    -- General search keybindings (formerly from Telescope)
    vim.keymap.set("n", "<leader>sh", function() fzf.help_tags() end, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sk", function() fzf.keymaps() end, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>f", function() fzf.files() end, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>ss", function() fzf.builtin() end, { desc = "[S]earch [S]elect FZF" })
    vim.keymap.set("n", "<leader>sw", function() fzf.grep_cword() end, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", function() fzf.live_grep() end, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", function() fzf.lsp_workspace_diagnostics() end, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>sr", function() fzf.resume() end, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader>s.", function() fzf.oldfiles() end, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader>b", function() fzf.buffers() end, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>.", function()
      fzf.files({ cwd = vim.fn.expand("%:p:h") })
    end, { desc = "Find files in current buffer directory" })

    vim.keymap.set("n", "<leader>/", function()
      fzf.grep_curbuf()
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", "<leader>s/", function()
      fzf.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })

    vim.keymap.set("n", "<leader>sn", function()
      fzf.files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })
  end,
}
