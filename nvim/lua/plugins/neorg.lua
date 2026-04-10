return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "0.9.4",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              workJournal = "~/.config/neorg/work",
            },
          },
        },
        ["core.journal"] = {
          config = {
            workspace = "workJournal",
          },
        },
        -- ["core.highlights"] = {},
        -- ["core.export"] = {},
        -- ["core.export.markdown"] = {},
      },
    })
  end,
}
