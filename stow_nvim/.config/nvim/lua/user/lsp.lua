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

M.diagnostics = {
    underline = true,
    update_in_insert = false,
    virtual_text = true,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "if_many",
    },
}

M.on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "<leader>ld", vim.diagnostic.open_float, opts)
    keymap("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap("n", "]d", vim.diagnostic.goto_next, opts)
end

-- Add completion capabilities here if needed (e.g., from blink.cmp)
do
    local ok, blink = pcall(require, "blink.cmp")
    if ok and blink.get_lsp_capabilities then
        M.capabilities = blink.get_lsp_capabilities()
    else
        M.capabilities = nil
    end
end

return M
