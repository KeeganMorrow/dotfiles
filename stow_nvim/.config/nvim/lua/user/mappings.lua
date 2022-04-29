
-- Set up Key bindings
--------------------------------------------------------------------------------
--
require("mapx").setup { global=true, whichkey=true }

nnoremap('[b', ':bprev<CR>', 'silent')
nnoremap(']b', ':bnext<CR>', 'silent')

