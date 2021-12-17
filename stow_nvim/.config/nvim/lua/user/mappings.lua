
-- Set up Key bindings
--------------------------------------------------------------------------------
--
require("mapx").setup { global=true, whichkey=true }

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

