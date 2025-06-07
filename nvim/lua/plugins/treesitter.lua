return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  main = "nvim-treesitter.configs", -- Sets main module to use for opts
  opts = {
    ensure_installed = { "c", "cpp", "lua", "javascript", "go", "rust", "typescript", "markdown", "python" },
    auto_install = true,
    highlight = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>p"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>P"] = "@parameter.inner",
        },
      },
    },
    indent = { enable = true, disable = { "ruby" } },
  },
}
