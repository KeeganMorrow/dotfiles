-- Set up Key bindings
--------------------------------------------------------------------------------
vim.keymap.set("n", "[b", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "]b", ":bprev<CR>", { desc = "Previous Buffer" })
