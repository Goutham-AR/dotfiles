vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        map('gr', require("fzf-lua").lsp_references, "Go to references")
        map('<leader>s', require("fzf-lua").lsp_document_symbols, "List document symbols")
        map('<leader>ws', require("fzf-lua").lsp_workspace_symbols, "List workspace symbols")
    end
})
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Check if opening a directory
    local directory = vim.fn.argv(0)
    if vim.fn.isdirectory(directory) == 1 then
      vim.cmd("Neotree toggle")
      vim.cmd("cd " .. directory) -- Set working directory
    end
  end
})
