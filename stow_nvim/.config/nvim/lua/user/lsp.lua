vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                -- Prevent annoying warnings when looking at vim configs
                globals = { "vim" },
            },
        },
    },
})
