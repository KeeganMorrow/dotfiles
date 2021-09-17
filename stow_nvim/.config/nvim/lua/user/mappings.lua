
-- Set up Key bindings
--------------------------------------------------------------------------------
--
require("mapx").setup { global=true, whichkey=true }

-- Helper function to get and show list of active lsp clients
function connected_lsp_clients()
    local clients = {}
    local icon = ' '

    for _, client in pairs(vim.lsp.buf_get_clients()) do
        clients[#clients+1] = icon .. client.name
    end

    return table.concat(clients, ' ')
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', '<leader>lD', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap("n", "<leader>lF", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("v", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

end

-------------------------------------------------------------------------------
-- LSP Related keybinds
-------------------------------------------------------------------------------
-- Lspsaga key bindings
nnoremap('<leader>la', '<cmd>lua require(\'lspsaga.codeaction\').code_action()<CR>', 'silent', 'LSP Action')
vnoremap('<leader>la', ':<C-U>lua require(\'lspsaga.codeaction\').range_code_action()<CR>', 'silent', 'LSP Action')
nnoremap('<leader>lh', '<cmd>lua require(\'lspsaga.hover\').render_hover_doc()<CR>', 'silent', 'LSP Hover')
nnoremap('<C-f>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', 'silent', 'LSP Scroll Up')
nnoremap('<C-b>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', 'silent', 'LSP Scroll Down')
nnoremap('<leader>ls', '<cmd>lua require(\'lspsaga.signaturehelp\').signature_help()<CR>', 'silent', 'LSP Signature')
nnoremap('<leader>lr', '<cmd>lua require(\'lspsaga.rename\').rename()<CR>', 'silent', 'LSP Rename')
nnoremap('<leader>ld', ':Lspsaga preview_definition<CR>', 'silent', 'Preview LSP Definition')
nnoremap('[d', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_prev()<CR>', 'silent', 'Prev Diagnostic')
nnoremap(']d', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_next()<CR>', 'silent', 'Next Diagnostic')


-- Find files using Telescope command-line sugar.
nnoremap('<leader>tf', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>tg', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>tb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>th', '<cmd>Telescope help_tags<cr>')
nnoremap('<leader>tD', '<cmd>Telescope lsp_document_diagnostics<cr>')
nnoremap('<leader>td', '<cmd>Telescope lsp_workspace_diagnostics<cr>')
nnoremap('<leader>tr', '<cmd>Telescope lsp_references<cr>')
nnoremap('<leader>tS', '<cmd>Telescope treesitter<cr>')
nnoremap('<leader>ts', '<cmd>Telescope lsp_document_symbols<cr>')
nnoremap('<leader>tl', '<cmd>Telescope git_bcommits<cr>')
nnoremap('<leader>tq', '<cmd>Telescope gquickfix<cr>')
nnoremap('z=', '<cmd>Telescope spell_suggest<cr>')

nnoremap('[b', ':BufferPrevious<CR>', 'silent')
nnoremap(']b', ':BufferNext<CR>', 'silent')

nnoremap('<leader>b', ':BufferPick<CR>')

-- Set up Key bindings
--------------------------------------------------------------------------------

-- Helper function to get and show list of active lsp clients
function connected_lsp_clients()
    local clients = {}
    local icon = ' '

    for _, client in pairs(vim.lsp.buf_get_clients()) do
        clients[#clients+1] = icon .. client.name
    end

    return table.concat(clients, ' ')
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', '<leader>lD', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap("n", "<leader>lF", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("v", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

end

-------------------------------------------------------------------------------
-- LSP Related keybinds
-------------------------------------------------------------------------------
-- Lspsaga key bindings
nnoremap('<leader>la', '<cmd>lua require(\'lspsaga.codeaction\').code_action()<CR>', 'silent', 'LSP Action')
vnoremap('<leader>la', ':<C-U>lua require(\'lspsaga.codeaction\').range_code_action()<CR>', 'silent', 'LSP Action')
nnoremap('<leader>lh', '<cmd>lua require(\'lspsaga.hover\').render_hover_doc()<CR>', 'silent', 'LSP Hover')
nnoremap('<C-f>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', 'silent', 'LSP Scroll Up')
nnoremap('<C-b>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', 'silent', 'LSP Scroll Down')
nnoremap('<leader>ls', '<cmd>lua require(\'lspsaga.signaturehelp\').signature_help()<CR>', 'silent', 'LSP Signature')
nnoremap('<leader>lr', '<cmd>lua require(\'lspsaga.rename\').rename()<CR>', 'silent', 'LSP Rename')
nnoremap('<leader>ld', ':Lspsaga preview_definition<CR>', 'silent', 'Preview LSP Definition')
nnoremap('[d', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_prev()<CR>', 'silent', 'Prev Diagnostic')
nnoremap(']d', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_next()<CR>', 'silent', 'Next Diagnostic')


-- Find files using Telescope command-line sugar.
nnoremap('<leader>tf', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>tg', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>tb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>th', '<cmd>Telescope help_tags<cr>')
nnoremap('<leader>tD', '<cmd>Telescope lsp_document_diagnostics<cr>')
nnoremap('<leader>td', '<cmd>Telescope lsp_workspace_diagnostics<cr>')
nnoremap('<leader>tr', '<cmd>Telescope lsp_references<cr>')
nnoremap('<leader>tS', '<cmd>Telescope treesitter<cr>')
nnoremap('<leader>ts', '<cmd>Telescope lsp_document_symbols<cr>')
nnoremap('<leader>tl', '<cmd>Telescope git_bcommits<cr>')
nnoremap('<leader>tq', '<cmd>Telescope gquickfix<cr>')
nnoremap('z=', '<cmd>Telescope spell_suggest<cr>')

nnoremap('[b', ':BufferPrevious<CR>', 'silent')
nnoremap(']b', ':BufferNext<CR>', 'silent')

nnoremap('<leader>b', ':BufferPick<CR>')

