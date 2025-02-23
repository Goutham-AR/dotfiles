return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      -- ensure_installed = { "c", "cpp", "lua", "javascript", "go", "rust", "typescript", "markdown", "python" },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
}
