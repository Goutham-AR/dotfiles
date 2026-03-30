-- VSCode-specific keymaps (only loaded when running in vscode-neovim)
-- Overrides terminal neovim keymaps with VSCode-native equivalents

local vsc = function(cmd)
  return function() require("vscode").action(cmd) end
end

-- LSP Navigation (use VSCode's LSP instead of neovim's)
vim.keymap.set("n", "gd", vsc("editor.action.revealDefinition"))
vim.keymap.set("n", "gpd", vsc("editor.action.peekDefinition"))
vim.keymap.set("n", "gI", vsc("editor.action.goToImplementation"))
vim.keymap.set("n", "gpI", vsc("editor.action.peekImplementation"))
vim.keymap.set("n", "gD", vsc("editor.action.revealDeclaration"))
vim.keymap.set("n", "gt", vsc("editor.action.goToTypeDefinition"))
vim.keymap.set("n", "gpt", vsc("editor.action.peekTypeDefinition"))

-- Diagnostics
vim.keymap.set("n", "]d", vsc("editor.action.marker.next"))
vim.keymap.set("n", "[d", vsc("editor.action.marker.prev"))

-- References & rename
vim.keymap.set("n", "gr", vsc("editor.action.goToReferences"))
vim.keymap.set("n", "grn", vsc("editor.action.rename"))

-- Hover
vim.keymap.set("n", "<leader>k", vsc("editor.action.showHover"))

-- Editor tab navigation
vim.keymap.set("n", "<leader>n", vsc("workbench.action.nextEditor"))
vim.keymap.set("n", "<leader>p", vsc("workbench.action.previousEditor"))
vim.keymap.set("n", "<C-p>", vsc("workbench.action.quickOpen"))

-- Sidebar / Explorer
vim.keymap.set("n", "<leader>e", vsc("workbench.action.toggleSidebarVisibility"))
vim.keymap.set("n", "<leader>ge", vsc("workbench.view.explorer"))

-- Search / Find
vim.keymap.set("n", "<leader>/", vsc("workbench.action.findInFiles"))
vim.keymap.set("n", "<leader>sg", vsc("workbench.action.findInFiles"))
vim.keymap.set("n", "<leader>sr", vsc("workbench.action.findInFiles"))
vim.keymap.set("n", "<leader>f", vsc("workbench.action.quickOpen"))
vim.keymap.set("n", "<leader>.", vsc("workbench.action.quickOpen"))

-- Buffer list
vim.keymap.set("n", "<leader>b", vsc("workbench.action.showAllEditors"))

-- Format
vim.keymap.set("n", "<leader>ll", vsc("editor.action.formatDocument"))

-- Comments (override neovim's gcc-based comment with VSCode's)
vim.keymap.set("n", "<leader>c", vsc("editor.action.commentLine"))
vim.keymap.set("v", "<leader>c", vsc("editor.action.commentLine"))

-- Symbols
vim.keymap.set("n", "<leader>ds", vsc("workbench.action.gotoSymbol"))
vim.keymap.set("n", "<leader>ws", vsc("workbench.action.showAllSymbols"))

-- Misc
vim.keymap.set("n", "<leader>sh", vsc("workbench.action.openGettingStartedPage"))
vim.keymap.set("n", "<leader>sk", vsc("workbench.action.openGlobalKeybindings"))
vim.keymap.set("n", "<leader>sb", vsc("workbench.action.showCommands"))
