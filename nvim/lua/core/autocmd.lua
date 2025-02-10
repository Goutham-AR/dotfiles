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
    local builtin = require("telescope.builtin")
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end
    map("gr", builtin.lsp_references, "Go to references")
    map("<leader>ds", builtin.lsp_document_symbols, "List document symbols")
    map("<leader>ws", builtin.lsp_workspace_symbols, "List workspace symbols")
  end,
})
-- vim.api.nvim_create_autocmd("VimEnter", {
-- callback = function()
-- local directory = vim.fn.argv(0)
-- if vim.fn.isdirectory(directory) == 1 then
-- vim.cmd("Neotree toggle")
-- vim.cmd("cd " .. directory) -- Set working directory
-- end
-- end
-- })
