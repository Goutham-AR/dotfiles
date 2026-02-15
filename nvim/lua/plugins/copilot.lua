-- return {
-- "zbirenbaum/copilot.lua",
-- cmd = "Copilot",
-- event = "InsertEnter",
-- config = function()
-- require("copilot").setup({
-- suggestion = {
-- enabled = true,
-- auto_trigger = true,
-- hide_during_completion = true,
-- debounce = 75,
-- trigger_on_accept = true,
-- keymap = {
-- accept = "<C-i>",
-- accept_word = false,
-- accept_line = false,
-- next = "<M-]>",
-- prev = "<M-[>",
-- dismiss = "<C-]>",
-- },
-- },
-- })
-- end,
-- }
return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("i", "<C-i>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
    vim.g.copilot_no_tab_map = true
  end,
}
