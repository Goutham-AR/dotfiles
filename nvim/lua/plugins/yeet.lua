return {
  "samharju/yeet.nvim",
  -- version = "*", -- use the latest release, remove for master
  cmd = "Yeet",
  opts = {},
  config = function()
    local yeet = require("yeet")
    yeet.setup()
    vim.keymap.set("n", "<leader>m", function()
      yeet.execute("cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B build", { clean_before_yeet = true })
    end, { desc = "Run cmake generate" })
  end,
}
