vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end
    local builtin = require("telescope.builtin")
    -- map("gr", require("fzf-lua").lsp_references, "Go to references")
    -- map("<leader>ds", require('telescope.builtin').lsp_document_symbols, "List document symbols")
    -- map("<leader>ws", require("fzf-lua").lsp_workspace_symbols, "List workspace symbols")
    -- map("<leader>dd", require("fzf-lua").diagnostics_document, "List document diagnostics")
    -- map("<leader>wd", require("fzf-lua").diagnostics_workspace, "List workspace diagnostics")
  end,
})
