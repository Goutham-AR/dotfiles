return {
    "preservim/vimux",
    config = function()
        vim.keymap.set("n", "<leader>m", ":VimuxRunCommand('cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B build')<CR>", { desc = "cmake generate" })
        vim.keymap.set("n", "<leader>r", ":VimuxRunCommand('ninja -C build')<CR>", { desc = "ninja build" })
        vim.keymap.set("n", "<leader>cl", ":VimuxClearTerminalScreen<CR>", { desc = "Clear tmux Pane" })
        vim.keymap.set("n", "<leader>t", ":VimuxTogglePane<CR>", { desc = "toggle tmux pane" })
    end
}
