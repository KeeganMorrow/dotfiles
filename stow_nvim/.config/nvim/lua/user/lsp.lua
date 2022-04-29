-- Set up Language Server Protocol
--------------------------------------------------------------------------------
--
local lsp_installer = require("nvim-lsp-installer")

-- Include the servers you want to have installed by default below
local servers = {
	"bashls",
	"clangd",
	"cmake",
	"cssls",
	"dockerls",
	"eslint",
	"hls",
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
			client.resolved_capabilities.document_formatting = true
			client.resolved_capabilities.document_range_formatting = true
		end
		options.settings = {
			format = { enable = true }, -- this will enable formatting
		}
	end,
}

-- global on_attach
local on_attach_base = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
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

		require("navigator.lspclient.mapping").setup({
			client = client,
			bufnr = bufnr,
			cap = capabilities,
		})

		if server_on_attach then
			server_on_attach(client, bufnr)
		end
	end

	return options
end

lsp_installer.on_server_ready(function(server)
	server:setup(enhance_global_opts(server, options))
end)

-- Helper function to get and show list of active lsp clients
function connected_lsp_clients()
	local clients = {}
	local icon = " "

	for _, client in pairs(vim.lsp.buf_get_clients()) do
		clients[#clients + 1] = icon .. client.name
	end

	return table.concat(clients, " ")
end
