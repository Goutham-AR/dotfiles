return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- "hrsh7th/cmp-nvim-lsp",
    "saghen/blink.cmp",
  },
  config = function()
    -- local cap = require("cmp_nvim_lsp").default_capabilities()
    local cap = require('blink.cmp').get_lsp_capabilities()

    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup({
      capabilities = cap,
    })
    lspconfig.ts_ls.setup({
      capabilities = cap,
    })
    lspconfig.pyright.setup({
      capabilities = cap,
    })
    lspconfig.lua_ls.setup({
      capabilities = cap,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim", "require" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    })
    lspconfig.jsonls.setup({
      capabilities = cap,
    })
    lspconfig.cmake.setup({})
    lspconfig.csharp_ls.setup({ capabilities = cap })
    lspconfig.gopls.setup({ capabilities = cap })
    lspconfig.markdown_oxide.setup({ capabilities = cap })

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
    vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Go to references" })
    vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Go to references" })
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover Docs" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
  end,
}
