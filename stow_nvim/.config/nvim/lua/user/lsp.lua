-- Set up Language Server Protocol
--------------------------------------------------------------------------------
--
local lsp_installer = require("nvim-lsp-installer")
local lsp_config = require("lspconfig")
local mapx = require("mapx")

lsp_installer.setup({})

-- Include the servers you want to have installed by default below
local servers = {
    "bashls",
    "clangd",
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
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end

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

local enhance_global_opts = function(server, options)
    local options = {}

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    options.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

    -- server specific configs
    if enhance_server_opts[server.name] then
        enhance_server_opts[server.name](options)
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

        mapx.nnoremap(
            "<Leader>lr",
            "<cmd> lua require('navigator.reference').async_ref()<CR>",
            "LSP Show References"
        )
        mapx.nnoremap(
            "<Leader>lp",
            "<cmd> lua require('navigator.definition').definition_preview()<CR>",
            "LSP Preview Definition"
        )
        mapx.nnoremap(
            "<Leader>gt",
            "<cmd> lua require('navigator.treesitter').buf_ts()<CR>",
            "Treesitter buffer symbols"
        )
        mapx.nnoremap(
            "<Leader>gT",
            "<cmd> lua require('navigator.treesitter').bufs_ts()<CR>",
            "Tresitter symbols"
        )

        -- Navigator mappings
        mapx.nnoremap(
            "<leader>lh",
            "hover({ popup_opts = { border = single, max_width = 80 }})",
            "LSP Hover"
        )
        mapx.nnoremap(
            "<Leader>dd",
            "<cmd> lua require('navigator.diagnostics').toggle_diagnostics()<CR>",
            "LSP Toggle Diagnostics"
        )
        mapx.nnoremap(
            "]d",
            "diagnostic.goto_next({ border = 'rounded', max_width = 80})",
            "LSP Next Diagnostic"
        )
        mapx.nnoremap(
            "[d",
            "diagnostic.goto_prev({ border = 'rounded', max_width = 80})",
            "LSP Previous Diagnostic"
        )

        mapx.nnoremap(
            "]r",
            "<cmd> lua require('navigator.treesitter').goto_next_usage()<CR>",
            "Treesitter Next Usage"
        )
        mapx.nnoremap(
            "[r",
            "<cmd> lua require('navigator.treesitter').goto_previous_usage()<CR>",
            "Treesitter Previous Usage"
        )
        mapx.nnoremap("<Leader>k", "<cmd> lua require('navigator.dochighlight').hi_symbol()<CR>")

        mapx.nnoremap("<Leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", "LSP Formatting")
        mapx.vnoremap(
            "<Leader>lf",
            "<cmd>lua vim.lsp.buf.range_formatting()<CR>",
            "LSP Range formatting"
        )
        mapx.nnoremap(
            "<Leader>lA",
            "<cmd> lua require('navigator.codelens').run_action()<CR>",
            "LSP Code Lens"
        )
        mapx.nnoremap(
            "<Leader>la",
            "<cmd> lua require('navigator.codeAction').code_action()<CR>",
            "LSP Code Action"
        )
        mapx.vnoremap("<Leader>lA", "range_code_action()", "LSP Range Code Action")

        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
                local opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = "rounded",
                    source = "always",
                    prefix = " ",
                    scope = "cursor",
                }
                vim.diagnostic.open_float(nil, opts)
            end,
        })

        if server_on_attach then
            server_on_attach(client, bufnr)
        end
    end

    return options
end

for _, server in ipairs(lsp_installer.get_installed_servers()) do
    lsp_config[server.name].setup(enhance_global_opts(server, options))
end

-- Helper function to get and show list of active lsp clients
function connected_lsp_clients()
    local clients = {}
    local icon = " "

    for _, client in pairs(vim.lsp.buf_get_clients()) do
        clients[#clients + 1] = icon .. client.name
    end

    return table.concat(clients, " ")
end