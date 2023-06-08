-- Set up Language Server Protocol
--------------------------------------------------------------------------------
--
local mason_lspconfig = require("mason-lspconfig")
local mason = require("mason")
local mapx = require("mapx")
local lsp_config = require("lspconfig")

mason.setup()
mason_lspconfig.setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "ccls",
        "cmake",
        "cssls",
        "dockerls",
        "eslint",
        "html",
        "jsonls",
        "pyright",
        "rust_analyzer",
        "sumneko_lua",
        "verible",
        "vimls",
        "yamlls",
        "solargraph",
    },
    automatic_installation = true,
})

local enhance_server_opts = {
    ["sumneko_lua"] = function(options)
        options.settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        }
    end,
    ["tsserver"] = function(options)
        options.on_attach = function(client, bufnr)
            local ts_utils = require("nvim-lsp-ts-utils")
            ts_utils.setup({})
            ts_utils.setup_client(client)

            -- no default maps, so you may want to define some here
            local opts = { silent = true }
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
            -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
        end
    end,

    ["clangd"] = function(options)
        options.on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = true
            client.server_capabilities.document_range_formatting = true
        end
        options.settings = {
            format = { enable = true }, -- this will enable formatting
        }
    end,
}

-- global on_attach
local on_attach_base = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
end

local enhance_global_opts = function(server_name, options)
    local options = {}

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    options.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- server specific configs
    if enhance_server_opts[server_name] then
        enhance_server_opts[server_name](options)
    end

    -- prepend global config options
    local server_on_attach = options.on_attach

    options.on_attach = function(client, bufnr)
        on_attach_base(client, bufnnr)

        -- Telescope LSP bindings
        mapx.nnoremap(
            "<leader>tD",
            "<cmd>Telescope lsp_document_diagnostics<cr>",
            "Telescope Doc Diagnostics"
        )
        mapx.nnoremap(
            "<leader>td",
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Telescope WS Diagnostics"
        )
        mapx.nnoremap("<leader>tr", "<cmd>Telescope lsp_references<cr>", "Telescope references")
        mapx.nnoremap(
            "<leader>ts",
            "<cmd>Telescope lsp_document_symbols<cr>",
            "Telescope Doc symbols"
        )
        mapx.nnoremap(
            "<leader>tS",
            "<cmd>Telescope lsp_workspace_symbols<cr>",
            "Telescope WS symbols"
        )
        -- Question - can we figure out how to jump back?

        -- Trouble LSP bindings
        mapx.nnoremap("<Leader>lg", ":Trouble document_diagnostics<CR>", "LSP Diagnostics")
        mapx.nnoremap(
            "<Leader>lG",
            ":Trouble workspace_diagnostics<CR>",
            "LSP Workspace Diagnostics"
        )

        mapx.nnoremap("<Leader>lR", function()
            return ":IncRename " .. vim.fn.expand("<cword>")
        end, "expr", "LSP Rename")
        -- Jump to bindings
        mapx.nnoremap("<Leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "LSP Declaration")
        mapx.nnoremap("<Leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP Definition")
        mapx.nnoremap(
            "<Leader>li",
            "<cmd>lua vim.lsp.buf.implementation()<CR>",
            "LSP Implementation"
        )
        mapx.nnoremap(
            "<Leader>lt",
            "<cmd>lua vim.lsp.buf.type_definition()<CR>",
            "LSP Type Definition"
        )

        -- TODO figure out why these don't work
        mapx.nnoremap(
            "<Leader>lci",
            "<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
            "LSP Incoming Calls"
        )
        mapx.nnoremap(
            "<Leader>lco",
            "<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
            "LSP Outgoing Calls"
        )

        mapx.nnoremap("<Leader>lr", "<cmd>Lspsaga lsp_finder<CR>", "LSP Show References")
        mapx.nnoremap("<Leader>lp", "<cmd>Lspsaga preview_definition<CR>", "LSP Preview Definition")

        mapx.nnoremap("K", "<cmd>Lspsaga hover_doc<CR>", "LSP Hover")
        mapx.nnoremap("<leader>le", "<cmd>Lspsaga show_line_diagnostics<CR>", "LSP Hover")
        mapx.nnoremap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "LSP Next Diagnostic")
        mapx.nnoremap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "LSP Previous Diagnostic")

        mapx.nnoremap("<Leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<CR>", "LSP Formatting")

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

        mapx.vnoremap("<Leader>lf", "<cmd>lua format_range_operator()<CR>", "LSP Range formatting")
        mapx.nnoremap("<Leader>la", "<cmd>Lspsaga code_action<CR>", "LSP Code Action")
        mapx.vnoremap("<Leader>la", "<cmd>Lspsaga code_action<CR>", "LSP Range Code Action")

        if server_on_attach then
            server_on_attach(client, bufnr)
        end
    end

    return options
end

mason_lspconfig.setup_handlers({
    function(server_name)
        lsp_config[server_name].setup(enhance_global_opts(server_name, options))
    end,
    {},
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
