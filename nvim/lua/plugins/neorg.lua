return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",

  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              journals = "~/Documents/secondbrain",
            },
          },
        },
        ["core.journal"] = {
          config = {
            workspace = "journals",
          },
        },
        ["core.highlights"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.export"] = {},
        ["core.export.markdown"] = {},
      },
    })
  end,
}
