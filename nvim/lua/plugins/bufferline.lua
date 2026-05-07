return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        custom_filter = function(buf_number)
          return vim.bo[buf_number].filetype ~= "oil"
        end,
      },
    })
  end,
}
