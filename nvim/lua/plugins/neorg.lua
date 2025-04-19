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
              secondBrain = "~/Documents/dev/SecondBrain/",
              todo = "~/Documents/dev/SecondBrain/todo/",
              notes = "~/Documents/dev/SecondBrain/notes/",
              journals = "~/Documents/dev/SecondBrain/journals/",
            },
          },
        },
      },
    })
  end,
}
