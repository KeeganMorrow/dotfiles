local M = {}

M.servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    -- Prevent annoying warnings when looking at vim configs
                    globals = { "vim" },
                },
            },
        },
    },
}

M.ensure_installed = {
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    "dockerls",
    "eslint",
    "html",
    "jqls",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "solargraph",
    "lua_ls",
    "vimls",
    "yamlls",
}

-- Add completion capabilities here if needed (e.g., from blink.cmp)
M.capabilities = nil

return M
