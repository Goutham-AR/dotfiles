return { -- Autoformat
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  lazy = true,
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>ll",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    -- format_on_save = function(bufnr)
    -- local enable_filetypes = { javascript = false, typescript = false, typescriptreact = true }
    -- local lsp_format_opt
    -- if enable_filetypes[vim.bo[bufnr].filetype] then
    -- lsp_format_opt = "fallback"
    -- else
    -- lsp_format_opt = "never"
    -- end
    -- return {
    -- timeout_ms = 1000,
    -- lsp_format = lsp_format_opt,
    -- }
    -- end,
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      cpp = { "clang-format" },
    },
  },
}
