return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      -- options = { theme = "gruvbox-material" },
      options = { theme = "auto" },
      sections = {
        lualine_c = {
          { "filename", path = 1 },
        },
      },
    })
  end,
}
