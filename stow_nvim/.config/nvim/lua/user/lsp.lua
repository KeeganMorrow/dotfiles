-- Set up Language Server Protocol
--------------------------------------------------------------------------------
--
local mason_lspconfig = require("mason-lspconfig")
local mason = require("mason")
local lsp_config = require("lspconfig")

mason.setup()
meson_servers = {
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

if not vim.fn.has("macunix") then
    -- Verible doesn't work on Mac
    table.insert(meson_servers, "verible")
end
mason_lspconfig.setup({
    ensure_installed = meson_servers,
    automatic_installation = true,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    }
})

vim.lsp.config("tsserver", {
        on_attach = function(client, bufnr)
            local ts_utils = require("nvim-lsp-ts-utils")
            ts_utils.setup({})
            ts_utils.setup_client(client)

            -- no default maps, so you may want to define some here
            local opts = { silent = true }
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
            -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
        end,
        settings = {
            format = { enable = true }, -- this will enable formatting
        }
})

vim.lsp.config("clangd", {
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = true
            client.server_capabilities.document_range_formatting = true
        end,
        settings = {
            format = { enable = true }, -- this will enable formatting
        }
})

vim.lsp.config("*", {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false

        -- Telescope LSP bindings
        vim.keymap.set(
            "n",
            "<leader>tD",
            "<cmd>Telescope lsp_document_diagnostics<cr>",
            { desc = "Telescope Doc Diagnostics" }
        )
        vim.keymap.set(
            "n",
            "<leader>td",
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            { desc = "Telescope WS Diagnostics" }
        )
        vim.keymap.set(
            "n",
            "<leader>tr",
            "<cmd>Telescope lsp_references<cr>",
            { desc = "Telescope references" }
        )
        vim.keymap.set(
            "n",
            "<leader>ts",
            "<cmd>Telescope lsp_document_symbols<cr>",
            { desc = "Telescope Doc symbols" }
        )
        vim.keymap.set(
            "n",
            "<leader>tS",
            "<cmd>Telescope lsp_workspace_symbols<cr>",
            { desc = "Telescope WS symbols" }
        )
        -- Question - can we figure out how to jump back?

        -- Trouble LSP bindings
        vim.keymap.set(
            "n",
            "<Leader>lg",
            ":Trouble document_diagnostics<CR>",
            { desc = "LSP Diagnostics" }
        )
        vim.keymap.set(
            "n",
            "<Leader>lG",
            ":Trouble workspace_diagnostics<CR>",
            { desc = "LSP Workspace Diagnostics" }
        )

        -- Jump to bindings
        vim.keymap.set(
            "n",
            "<Leader>lD",
            "<cmd>lua vim.lsp.buf.declaration()<CR>",
            { desc = "LSP Declaration" }
        )
        vim.keymap.set(
            "n",
            "<Leader>ld",
            "<cmd>lua vim.lsp.buf.definition()<CR>",
            { desc = "LSP Definition" }
        )
        vim.keymap.set(
            "n",
            "<Leader>li",
            "<cmd>lua vim.lsp.buf.implementation()<CR>",
            { desc = "LSP Implementation" }
        )
        vim.keymap.set(
            "n",
            "<Leader>lt",
            "<cmd>lua vim.lsp.buf.type_definition()<CR>",
            { desc = "LSP Type Definition" }
        )

        -- TODO figure out why these don't work
        vim.keymap.set(
            "n",
            "<Leader>lci",
            "<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
            { desc = "LSP Incoming Calls" }
        )
        vim.keymap.set(
            "n",
            "<Leader>lco",
            "<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
            { desc = "LSP Outgoing Calls" }
        )

        vim.keymap.set(
            "n",
            "<Leader>lr",
            "<cmd>Lspsaga lsp_finder<CR>",
            { desc = "LSP Show References" }
        )
        vim.keymap.set(
            "n",
            "<Leader>lp",
            "<cmd>Lspsaga preview_definition<CR>",
            { desc = "LSP Preview Definition" }
        )

        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP Hover" })
        vim.keymap.set(
            "n",
            "<leader>le",
            "<cmd>Lspsaga show_line_diagnostics<CR>",
            { desc = "LSP Hover" }
        )
        vim.keymap.set(
            "n",
            "]d",
            "<cmd>Lspsaga diagnostic_jump_next<CR>",
            { desc = "LSP Next Diagnostic" }
        )
        vim.keymap.set(
            "n",
            "[d",
            "<cmd>Lspsaga diagnostic_jump_prev<CR>",
            { desc = "LSP Previous Diagnostic" }
        )

        vim.keymap.set(
            "n",
            "<Leader>lf",
            "<cmd>lua vim.lsp.buf.format{async=true}<CR>",
            { desc = "LSP Formatting" }
        )

        function format_range_operator()
            local old_func = vim.go.operatorfunc
            _G.op_func_formatting = function()
                local start = vim.api.nvim_buf_get_mark(0, "[")
                local finish = vim.api.nvim_buf_get_mark(0, "]")
                vim.lsp.buf.range_formatting({}, start, finish)
                vim.go.operatorfunc = old_func
                _G.op_func_formatting = nil
            end
            vim.go.operatorfunc = "v:lua.op_func_formatting"
            vim.api.nvim_feedkeys("g@", "n", false)
        end

        vim.keymap.set(
            "v",
            "<Leader>lf",
            "<cmd>lua format_range_operator()<CR>",
            { desc = "LSP Range formatting" }
        )
        vim.keymap.set(
            "v",
            "<Leader>la",
            "<cmd>Lspsaga code_action<CR>",
            { desc = "LSP Code Action" }
        )
        vim.keymap.set(
            "v",
            "<Leader>la",
            "<cmd>Lspsaga code_action<CR>",
            { desc = "LSP Range Code Action" }
        )

        if server_on_attach then
            server_on_attach(client, bufnr)
        end
    end
})

-- Helper function to get and show list of active lsp clients
function connected_lsp_clients()
    local clients = {}
    local icon = " "

    for _, client in pairs(vim.lsp.buf_get_clients()) do
        clients[#clients + 1] = icon .. client.name
    end

    return table.concat(clients, " ")
end

-- Configure diagnostics
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    severity_sort = false,
    update_in_insert = true,
})

-- Configure diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = "ﴞ " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
