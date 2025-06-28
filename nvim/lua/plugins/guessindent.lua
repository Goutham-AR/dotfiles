return {
  "NMAC427/guess-indent.nvim",
  config = function()
    require("guess-indent").setup({
      on_tab_options = {
        ["tabstop"] = 4,
      },
    })
  end,
}
