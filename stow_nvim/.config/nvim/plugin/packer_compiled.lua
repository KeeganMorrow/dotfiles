-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/keegan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/keegan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/keegan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/keegan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/keegan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Dockerfile.vim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/Dockerfile.vim"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\nž\3\0\0\5\0\17\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0'\2\5\0'\3\6\0'\4\a\0B\0\4\0016\0\4\0'\2\b\0'\3\t\0'\4\n\0B\0\4\0016\0\4\0'\2\v\0'\3\f\0'\4\r\0B\0\4\0016\0\4\0'\2\14\0'\3\15\0'\4\16\0B\0\4\1K\0\1\0\19Navigator Down-<CMD>lua require('Navigator').down()<CR>\n<C-j>\20Navigator Right.<CMD>lua require('Navigator').right()<CR>\n<C-l>\17Navigator Up+<CMD>lua require('Navigator').up()<CR>\n<C-k>\19Navigator Left-<CMD>lua require('Navigator').left()<CR>\n<C-h>\rnnoremap\1\0\1\20disable_on_zoom\2\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/Navigator.nvim"
  },
  QFEnter = {
    config = { "\27LJ\2\n¡\1\0\0\2\0\b\0\r6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0K\0\1\0\1\2\0\0\n<C-t>\22qfenter_topen_map\1\4\0\0\v<C-CR>\n<C-s>\n<C-x>\22qfenter_hopen_map\1\2\0\0\t<C-v\22qfenter_vopen_map\6g\bvim\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/QFEnter"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/cmp-spell"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  ["committia.vim"] = {
    config = { "\27LJ\2\n„\2\0\0\4\0\6\0\v6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0+\3\2\0B\0\3\1K\0\1\0£\1            function! g:committia_hooks.edit_open(info)\n                setlocal spell\n                set colorcolumn=72\n            endfunction\n            \14nvim_exec\bapi\31let g:committia_hooks = {}\bcmd\bvim\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\nÐ\5\0\0\5\0&\0B6\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\4\0'\3\5\0'\4\3\0B\0\4\0016\0\0\0'\2\6\0'\3\a\0'\4\3\0B\0\4\0016\0\0\0'\2\b\0'\3\t\0'\4\n\0B\0\4\0016\0\0\0'\2\v\0'\3\f\0'\4\r\0B\0\4\0016\0\0\0'\2\14\0'\3\15\0'\4\r\0B\0\4\0016\0\0\0'\2\16\0'\3\17\0'\4\18\0B\0\4\0016\0\0\0'\2\19\0'\3\20\0'\4\21\0B\0\4\0016\0\0\0'\2\22\0'\3\23\0'\4\24\0B\0\4\0016\0\0\0'\2\25\0'\3\26\0'\4\27\0B\0\4\0016\0\28\0'\2\29\0'\3\30\0'\4\31\0B\0\4\0016\0 \0'\2\29\0'\3!\0'\4\"\0B\0\4\0016\0#\0'\2\29\0'\3$\0'\4%\0B\0\4\1K\0\1\0\19FZF O Mappings\23<plug>(fzf-maps-o)\tomap\19FZF X Mappings\23<plug>(fzf-maps-x)\txmap\19FZF N Mappings\23<plug>(fzf-maps-n)\18<leader><tab>\tnmap\16FZF Buffers\17:Buffers<CR>\14<leader>B\14FZF Marks\15:Marks<CR>\14<leader>m\rFZF Tags\14:Tags<CR>\14<leader>T\20FZF Buffer Tags\15:BTags<CR>\18<leader><c-t>\16:GFiles<CR>\14<leader>G\18FZF Git Files\17:GFiles?<CR>\14<leader>g\14FZF Files\15:Files<CR>\14<leader>t\18:History/<CR>\14<leader>/\17:History<CR>\14<leader>R\16FZF History\18:History:<CR>\14<leader>r\rnnoremap\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nŸ\3\0\0\2\0\r\0\0256\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0+\1\2\0=\1\n\0006\0\0\0009\0\1\0005\1\f\0=\1\v\0K\0\1\0\1\5\0\0\thelp\14dashboard\nunite\rstartify&indent_blankline_filetype_exclude$indent_blankline_use_treesitter\6 *indent_blankline_space_char_blankline\aÂ· indent_blankline_space_char\1\5\0\0\6|\aÂ¦\bâ”†\bâ”Š\31indent_blankline_char_list\1\5\0\0\16TSStructure\rTSString\15TSFunction\18TSConditional)indent_blankline_char_highlight_list\6g\bvim\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["linediff.vim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/linediff.vim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n}\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\tnone\1\0\2\16use_lspsaga\2\tbind\2\14on_attach\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n­\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\6\26dianostic_header_icon\bï« \14warn_sign\bï”©\21code_action_icon\bï« \15error_sign\bï™™\15infor_sign\bï‘‰\14hint_sign\bï µ\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n×\3\0\0\a\0\25\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\0034\4\3\0005\5\t\0>\5\1\4=\4\n\0034\4\5\0005\5\v\0>\5\1\0045\5\f\0>\5\2\0045\5\r\0>\5\3\0045\5\14\0>\5\4\4=\4\15\0034\4\4\0005\5\16\0>\5\1\0044\5\3\0006\6\17\0>\6\1\5>\5\2\0045\5\18\0005\6\19\0=\6\20\5>\5\3\4=\4\21\3=\3\22\0025\3\23\0=\3\24\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rquickfix\bfzf\rsections\14lualine_x\fsources\1\2\0\0\rnvim_lsp\1\2\0\0\16diagnostics\26connected_lsp_clients\1\2\0\0\tdiff\14lualine_c\1\2\0\0\17fileencoding\1\2\0\0\15fileformat\1\2\0\0\rfiletype\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\1\0\tmode\nlower\1\foptions\1\0\0\1\0\1\ntheme\14palenight\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["mapx.nvim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/mapx.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["neovim-remote"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/neovim-remote"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\3\0\0\20TelescopePrompt\bvim\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n›\2\0\0\b\0\v\2+6\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0B\0\3\2\a\0\4\0X\0\2€+\0\1\0L\0\2\0006\0\5\0006\2\0\0009\2\1\0029\2\6\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\0\0009\2\1\0029\2\a\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\b\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\t\2'\5\n\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\vunpack\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim\0\2p\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimÛ\1\0\2\5\0\n\0\0176\2\1\0'\4\2\0B\2\2\0029\2\3\0029\2\4\0029\3\0\0018\2\3\2'\3\5\0009\4\0\1&\2\4\2=\2\0\0015\2\a\0009\3\b\0009\3\t\0038\2\3\2=\2\6\1L\1\2\0\tname\vsource\1\0\5\fluasnip\14[LuaSnip]\rnvim_lsp\n[LSP]\18latex_symbols\f[Latex]\fvim_lua\n[Lua]\vbuffer\r[Buffer]\tmenu\6 \fdefault\fpresets\flspkind\frequire\tkind¶\1\0\1\5\1\b\1\0256\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\5€-\1\0\0'\3\3\0'\4\4\0B\1\3\1X\1\r€6\1\0\0009\1\1\0019\1\5\1B\1\1\2\t\1\0\0X\1\5€-\1\0\0'\3\6\0'\4\a\0B\1\3\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\6n\n<C-n>\15pumvisible\afn\bvim\2´\1\0\1\5\1\b\1\0266\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\5€-\1\0\0'\3\3\0'\4\4\0B\1\3\1X\1\14€6\1\0\0009\1\1\0019\1\5\1)\3ÿÿB\1\2\2\t\1\0\0X\1\5€-\1\0\0'\3\6\0'\4\a\0B\1\3\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\6n\n<C-p>\15pumvisible\afn\bvim\2—\5\1\0\v\0-\0J3\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\3\4\0025\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\v\0003\a\n\0=\a\f\6=\6\r\0055\6\16\0009\a\14\0029\a\15\aB\a\1\2=\a\17\0069\a\14\0029\a\18\aB\a\1\2=\a\19\0069\a\14\0029\a\20\a)\tüÿB\a\2\2=\a\21\0069\a\14\0029\a\20\a)\t\4\0B\a\2\2=\a\22\0069\a\14\0029\a\23\aB\a\1\2=\a\24\0069\a\14\0029\a\25\aB\a\1\2=\a\26\0069\a\14\0029\a\27\a5\t\30\0009\n\28\0029\n\29\n=\n\31\tB\a\2\2=\a \0063\a!\0=\a\"\0063\a#\0=\a$\6=\6\14\0054\6\b\0005\a%\0>\a\1\0065\a&\0>\a\2\0065\a'\0>\a\3\0065\a(\0>\a\4\0065\a)\0>\a\5\0065\a*\0>\a\6\0065\a+\0>\a\a\6=\6,\5B\3\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\tcalc\1\0\1\tname\tpath\1\0\1\tname\nspell\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15formatting\vformat\1\0\0\0\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0\0\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/nvim-fzf"
  },
  ["nvim-fzf-commands"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/nvim-fzf-commands"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0B\0\1\0016\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\fbufdo e\bcmd\bvim\18setup_serversš\4\1\0\r\0\20\0E6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0026\1\4\0'\3\5\0B\1\2\0029\1\6\1\18\3\0\0B\1\2\2\18\0\1\0006\1\4\0'\3\a\0B\1\2\0029\1\b\1B\1\1\0015\1\t\0006\2\4\0'\4\a\0B\2\2\0029\2\n\2B\2\1\0026\3\v\0\18\5\1\0B\3\2\4H\6\r€6\b\0\0009\b\f\b\18\n\2\0\18\v\a\0B\b\3\2\14\0\b\0X\b\6€6\b\4\0'\n\a\0B\b\2\0029\b\r\b\18\n\a\0B\b\2\1F\6\3\3R\6ñ6\3\4\0'\5\a\0B\3\2\0029\3\n\3B\3\1\0026\4\v\0\18\6\3\0B\4\2\4H\a\n€6\t\4\0'\v\14\0B\t\2\0028\t\b\t9\t\b\t5\v\15\0=\0\16\v6\f\17\0=\f\17\vB\t\2\1F\a\3\3R\aô6\4\4\0'\6\a\0B\4\2\0023\5\19\0=\5\18\4K\0\1\0\0\22post_install_hook\14on_attach\17capabilities\1\0\0\14lspconfig\19install_server\17tbl_contains\npairs\22installed_servers\1\n\0\0\tbash\ncmake\bcpp\tjson\blua\vpython\bvim\bvim\tyaml\nsetup\15lspinstall\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvim\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-reload"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/nvim-reload"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÆ\1\0\0\5\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0004\4\0\0=\4\6\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\fdisable\1\0\1\venable\2\19ignore_install\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/registers.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/spellsitter.nvim"
  },
  ["suda.vim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26command! W w suda://%\bcmd\bvim\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/suda.vim"
  },
  ["tabline.vim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/tabline.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tmux-complete.vim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/tmux-complete.vim"
  },
  ["tmuxline.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/opt/tmuxline.vim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17indent_lines\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  undotree = {
    config = { "\27LJ\2\nX\0\0\5\0\4\0\0066\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\1K\0\1\0\21Undo Tree Toggle\24:UndotreeToggle<CR>\15<leader>uu\rnnoremap\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-backup-tree"] = {
    config = { "\27LJ\2\n]\0\0\4\0\a\0\n6\0\0\0009\0\1\0006\1\0\0009\1\3\0019\1\4\1'\2\5\0'\3\6\0&\1\3\1=\1\2\0K\0\1\0\21.vim_backup_tree\6/\tHOME\benv\16backup_tree\6g\bvim\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-backup-tree"
  },
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\n†\2\0\0\5\0\n\0\0146\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\21Strip Whitespace\25:StripWhitespace<CR>\14<leader>W\rnnoremap\1\t\0\0\tdiff\14gitcommit\nunite\aqf\thelp\rmarkdown\14dashboard\rstartify*better_whitespace_filetypes_blacklist\14<leader>w\31better_whitespace_operator\6g\bvim\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-bitbake"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-bitbake"
  },
  ["vim-cppman"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-cppman"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\nX\0\0\5\0\4\0\v6\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\1K\0\1\0\15Easy Align\22<Plug>(EasyAlign)\aga\txmap\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-grepper"] = {
    config = { "\27LJ\2\n¡\3\0\0\5\0\v\0\0196\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0005\1\5\0=\1\4\0006\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\0016\0\n\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\txmap\21Grepper Operator\28<Plug>(GrepperOperator)\ags\tnmap\1\0\4\14searchreg\3\1\topen\3\0\rquickfix\3\1\14highlight\3\0\fgrepper\6gÜ\1augroup Grepper\n                    autocmd!\n                    autocmd User Grepper call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': histget('/')}}}) | botright copen\n                aug END\n            \bcmd\bvim\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-grepper"
  },
  ["vim-in-proportion"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-in-proportion"
  },
  ["vim-niceblock"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-niceblock"
  },
  ["vim-operator-replace"] = {
    config = { "\27LJ\2\nT\0\0\5\0\4\0\0066\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\1K\0\1\0\21Replace Operator\29<Plug>(operator-replace)\ag\"\fnoremap\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-operator-replace"
  },
  ["vim-operator-substitute"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-operator-substitute"
  },
  ["vim-operator-user"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-operator-user"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-slash"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-slash"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\nÂ\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\6\0\0\22               __!.-----..--.--.|__|.--------.!|  |  ||  |  ||  ||        |!|__|__| \\___/ |__||__|__|__|\5\nascii!startify_fortune_use_unicode\6g\bvim\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-superman"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-superman"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n‰\2\0\0\5\0\r\0\0216\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\4\0'\3\5\0'\4\6\0B\0\4\0016\0\0\0'\2\a\0'\3\b\0'\4\t\0B\0\4\0016\0\0\0'\2\n\0'\3\v\0'\4\f\0B\0\4\1K\0\1\0\21Run nearest test\21:TestNearest<cr>\15<leader>nn\18Run Last Test\18:TestLast<cr>\15<leader>nl\19Run Test Files\18:TestFile<cr>\15<leader>nf\19Run Test Suite\19:TestSuite<cr>\15<leader>ns\rnnoremap\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-textobj-comment"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-textobj-comment"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-textobj-entire"
  },
  ["vim-textobj-function"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-textobj-function"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-textobj-indent"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-multiblock"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-textobj-multiblock"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter"
  },
  ["vim-textobj-space"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-textobj-space"
  },
  ["vim-textobj-url"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-textobj-url"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-textobj-variable-segment"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-textobj-variable-segment"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vinarise.vim"] = {
    config = { "\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0 vinarise_enable_auto_detect\6g\bvim\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vinarise.vim"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\nÃ\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\4\0'\3\5\0'\4\6\0B\0\4\0016\0\a\0009\0\b\0'\1\n\0=\1\t\0K\0\1\0\rnvim_lsp\28vista_default_executive\6g\bvim\17Vista Finder\27:<C-u>Vista finder<CR>\14<leader>V\nVista\22:<C-u>Vista!!<CR>\14<leader>v\rnnoremap\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/keegan/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vista.vim
time([[Config for vista.vim]], true)
try_loadstring("\27LJ\2\nÃ\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\4\0'\3\5\0'\4\6\0B\0\4\0016\0\a\0009\0\b\0'\1\n\0=\1\t\0K\0\1\0\rnvim_lsp\28vista_default_executive\6g\bvim\17Vista Finder\27:<C-u>Vista finder<CR>\14<leader>V\nVista\22:<C-u>Vista!!<CR>\14<leader>v\rnnoremap\0", "config", "vista.vim")
time([[Config for vista.vim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\3\0\0\20TelescopePrompt\bvim\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-lspinstall
time([[Config for nvim-lspinstall]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0B\0\1\0016\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\fbufdo e\bcmd\bvim\18setup_serversš\4\1\0\r\0\20\0E6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0026\1\4\0'\3\5\0B\1\2\0029\1\6\1\18\3\0\0B\1\2\2\18\0\1\0006\1\4\0'\3\a\0B\1\2\0029\1\b\1B\1\1\0015\1\t\0006\2\4\0'\4\a\0B\2\2\0029\2\n\2B\2\1\0026\3\v\0\18\5\1\0B\3\2\4H\6\r€6\b\0\0009\b\f\b\18\n\2\0\18\v\a\0B\b\3\2\14\0\b\0X\b\6€6\b\4\0'\n\a\0B\b\2\0029\b\r\b\18\n\a\0B\b\2\1F\6\3\3R\6ñ6\3\4\0'\5\a\0B\3\2\0029\3\n\3B\3\1\0026\4\v\0\18\6\3\0B\4\2\4H\a\n€6\t\4\0'\v\14\0B\t\2\0028\t\b\t9\t\b\t5\v\15\0=\0\16\v6\f\17\0=\f\17\vB\t\2\1F\a\3\3R\aô6\4\4\0'\6\a\0B\4\2\0023\5\19\0=\5\18\4K\0\1\0\0\22post_install_hook\14on_attach\17capabilities\1\0\0\14lspconfig\19install_server\17tbl_contains\npairs\22installed_servers\1\n\0\0\tbash\ncmake\bcpp\tjson\blua\vpython\bvim\bvim\tyaml\nsetup\15lspinstall\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvim\0", "config", "nvim-lspinstall")
time([[Config for nvim-lspinstall]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17indent_lines\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÆ\1\0\0\5\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0004\4\0\0=\4\6\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\fdisable\1\0\1\venable\2\19ignore_install\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-backup-tree
time([[Config for vim-backup-tree]], true)
try_loadstring("\27LJ\2\n]\0\0\4\0\a\0\n6\0\0\0009\0\1\0006\1\0\0009\1\3\0019\1\4\1'\2\5\0'\3\6\0&\1\3\1=\1\2\0K\0\1\0\21.vim_backup_tree\6/\tHOME\benv\16backup_tree\6g\bvim\0", "config", "vim-backup-tree")
time([[Config for vim-backup-tree]], false)
-- Config for: vim-grepper
time([[Config for vim-grepper]], true)
try_loadstring("\27LJ\2\n¡\3\0\0\5\0\v\0\0196\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0005\1\5\0=\1\4\0006\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\0016\0\n\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\txmap\21Grepper Operator\28<Plug>(GrepperOperator)\ags\tnmap\1\0\4\14searchreg\3\1\topen\3\0\rquickfix\3\1\14highlight\3\0\fgrepper\6gÜ\1augroup Grepper\n                    autocmd!\n                    autocmd User Grepper call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': histget('/')}}}) | botright copen\n                aug END\n            \bcmd\bvim\0", "config", "vim-grepper")
time([[Config for vim-grepper]], false)
-- Config for: QFEnter
time([[Config for QFEnter]], true)
try_loadstring("\27LJ\2\n¡\1\0\0\2\0\b\0\r6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0K\0\1\0\1\2\0\0\n<C-t>\22qfenter_topen_map\1\4\0\0\v<C-CR>\n<C-s>\n<C-x>\22qfenter_hopen_map\1\2\0\0\t<C-v\22qfenter_vopen_map\6g\bvim\0", "config", "QFEnter")
time([[Config for QFEnter]], false)
-- Config for: vim-better-whitespace
time([[Config for vim-better-whitespace]], true)
try_loadstring("\27LJ\2\n†\2\0\0\5\0\n\0\0146\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\21Strip Whitespace\25:StripWhitespace<CR>\14<leader>W\rnnoremap\1\t\0\0\tdiff\14gitcommit\nunite\aqf\thelp\rmarkdown\14dashboard\rstartify*better_whitespace_filetypes_blacklist\14<leader>w\31better_whitespace_operator\6g\bvim\0", "config", "vim-better-whitespace")
time([[Config for vim-better-whitespace]], false)
-- Config for: vim-easy-align
time([[Config for vim-easy-align]], true)
try_loadstring("\27LJ\2\nX\0\0\5\0\4\0\v6\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\1K\0\1\0\15Easy Align\22<Plug>(EasyAlign)\aga\txmap\0", "config", "vim-easy-align")
time([[Config for vim-easy-align]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n}\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\tnone\1\0\2\16use_lspsaga\2\tbind\2\14on_attach\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n›\2\0\0\b\0\v\2+6\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0B\0\3\2\a\0\4\0X\0\2€+\0\1\0L\0\2\0006\0\5\0006\2\0\0009\2\1\0029\2\6\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\0\0009\2\1\0029\2\a\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\b\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\t\2'\5\n\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\vunpack\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim\0\2p\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimÛ\1\0\2\5\0\n\0\0176\2\1\0'\4\2\0B\2\2\0029\2\3\0029\2\4\0029\3\0\0018\2\3\2'\3\5\0009\4\0\1&\2\4\2=\2\0\0015\2\a\0009\3\b\0009\3\t\0038\2\3\2=\2\6\1L\1\2\0\tname\vsource\1\0\5\fluasnip\14[LuaSnip]\rnvim_lsp\n[LSP]\18latex_symbols\f[Latex]\fvim_lua\n[Lua]\vbuffer\r[Buffer]\tmenu\6 \fdefault\fpresets\flspkind\frequire\tkind¶\1\0\1\5\1\b\1\0256\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\5€-\1\0\0'\3\3\0'\4\4\0B\1\3\1X\1\r€6\1\0\0009\1\1\0019\1\5\1B\1\1\2\t\1\0\0X\1\5€-\1\0\0'\3\6\0'\4\a\0B\1\3\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\6n\n<C-n>\15pumvisible\afn\bvim\2´\1\0\1\5\1\b\1\0266\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\5€-\1\0\0'\3\3\0'\4\4\0B\1\3\1X\1\14€6\1\0\0009\1\1\0019\1\5\1)\3ÿÿB\1\2\2\t\1\0\0X\1\5€-\1\0\0'\3\6\0'\4\a\0B\1\3\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\6n\n<C-p>\15pumvisible\afn\bvim\2—\5\1\0\v\0-\0J3\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\3\4\0025\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\v\0003\a\n\0=\a\f\6=\6\r\0055\6\16\0009\a\14\0029\a\15\aB\a\1\2=\a\17\0069\a\14\0029\a\18\aB\a\1\2=\a\19\0069\a\14\0029\a\20\a)\tüÿB\a\2\2=\a\21\0069\a\14\0029\a\20\a)\t\4\0B\a\2\2=\a\22\0069\a\14\0029\a\23\aB\a\1\2=\a\24\0069\a\14\0029\a\25\aB\a\1\2=\a\26\0069\a\14\0029\a\27\a5\t\30\0009\n\28\0029\n\29\n=\n\31\tB\a\2\2=\a \0063\a!\0=\a\"\0063\a#\0=\a$\6=\6\14\0054\6\b\0005\a%\0>\a\1\0065\a&\0>\a\2\0065\a'\0>\a\3\0065\a(\0>\a\4\0065\a)\0>\a\5\0065\a*\0>\a\6\0065\a+\0>\a\a\6=\6,\5B\3\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\tcalc\1\0\1\tname\tpath\1\0\1\tname\nspell\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15formatting\vformat\1\0\0\0\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0\0\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n­\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\6\26dianostic_header_icon\bï« \14warn_sign\bï”©\21code_action_icon\bï« \15error_sign\bï™™\15infor_sign\bï‘‰\14hint_sign\bï µ\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\nÐ\5\0\0\5\0&\0B6\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\4\0'\3\5\0'\4\3\0B\0\4\0016\0\0\0'\2\6\0'\3\a\0'\4\3\0B\0\4\0016\0\0\0'\2\b\0'\3\t\0'\4\n\0B\0\4\0016\0\0\0'\2\v\0'\3\f\0'\4\r\0B\0\4\0016\0\0\0'\2\14\0'\3\15\0'\4\r\0B\0\4\0016\0\0\0'\2\16\0'\3\17\0'\4\18\0B\0\4\0016\0\0\0'\2\19\0'\3\20\0'\4\21\0B\0\4\0016\0\0\0'\2\22\0'\3\23\0'\4\24\0B\0\4\0016\0\0\0'\2\25\0'\3\26\0'\4\27\0B\0\4\0016\0\28\0'\2\29\0'\3\30\0'\4\31\0B\0\4\0016\0 \0'\2\29\0'\3!\0'\4\"\0B\0\4\0016\0#\0'\2\29\0'\3$\0'\4%\0B\0\4\1K\0\1\0\19FZF O Mappings\23<plug>(fzf-maps-o)\tomap\19FZF X Mappings\23<plug>(fzf-maps-x)\txmap\19FZF N Mappings\23<plug>(fzf-maps-n)\18<leader><tab>\tnmap\16FZF Buffers\17:Buffers<CR>\14<leader>B\14FZF Marks\15:Marks<CR>\14<leader>m\rFZF Tags\14:Tags<CR>\14<leader>T\20FZF Buffer Tags\15:BTags<CR>\18<leader><c-t>\16:GFiles<CR>\14<leader>G\18FZF Git Files\17:GFiles?<CR>\14<leader>g\14FZF Files\15:Files<CR>\14<leader>t\18:History/<CR>\14<leader>/\17:History<CR>\14<leader>R\16FZF History\18:History:<CR>\14<leader>r\rnnoremap\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\nX\0\0\5\0\4\0\0066\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\1K\0\1\0\21Undo Tree Toggle\24:UndotreeToggle<CR>\15<leader>uu\rnnoremap\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\nž\3\0\0\5\0\17\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0'\2\5\0'\3\6\0'\4\a\0B\0\4\0016\0\4\0'\2\b\0'\3\t\0'\4\n\0B\0\4\0016\0\4\0'\2\v\0'\3\f\0'\4\r\0B\0\4\0016\0\4\0'\2\14\0'\3\15\0'\4\16\0B\0\4\1K\0\1\0\19Navigator Down-<CMD>lua require('Navigator').down()<CR>\n<C-j>\20Navigator Right.<CMD>lua require('Navigator').right()<CR>\n<C-l>\17Navigator Up+<CMD>lua require('Navigator').up()<CR>\n<C-k>\19Navigator Left-<CMD>lua require('Navigator').left()<CR>\n<C-h>\rnnoremap\1\0\1\20disable_on_zoom\2\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: suda.vim
time([[Config for suda.vim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26command! W w suda://%\bcmd\bvim\0", "config", "suda.vim")
time([[Config for suda.vim]], false)
-- Config for: vinarise.vim
time([[Config for vinarise.vim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0 vinarise_enable_auto_detect\6g\bvim\0", "config", "vinarise.vim")
time([[Config for vinarise.vim]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\2\nÂ\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\6\0\0\22               __!.-----..--.--.|__|.--------.!|  |  ||  |  ||  ||        |!|__|__| \\___/ |__||__|__|__|\5\nascii!startify_fortune_use_unicode\6g\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: vim-operator-replace
time([[Config for vim-operator-replace]], true)
try_loadstring("\27LJ\2\nT\0\0\5\0\4\0\0066\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\1K\0\1\0\21Replace Operator\29<Plug>(operator-replace)\ag\"\fnoremap\0", "config", "vim-operator-replace")
time([[Config for vim-operator-replace]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nŸ\3\0\0\2\0\r\0\0256\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0+\1\2\0=\1\n\0006\0\0\0009\0\1\0005\1\f\0=\1\v\0K\0\1\0\1\5\0\0\thelp\14dashboard\nunite\rstartify&indent_blankline_filetype_exclude$indent_blankline_use_treesitter\6 *indent_blankline_space_char_blankline\aÂ· indent_blankline_space_char\1\5\0\0\6|\aÂ¦\bâ”†\bâ”Š\31indent_blankline_char_list\1\5\0\0\16TSStructure\rTSString\15TSFunction\18TSConditional)indent_blankline_char_highlight_list\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0", "config", "spellsitter.nvim")
time([[Config for spellsitter.nvim]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n‰\2\0\0\5\0\r\0\0216\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\4\0'\3\5\0'\4\6\0B\0\4\0016\0\0\0'\2\a\0'\3\b\0'\4\t\0B\0\4\0016\0\0\0'\2\n\0'\3\v\0'\4\f\0B\0\4\1K\0\1\0\21Run nearest test\21:TestNearest<cr>\15<leader>nn\18Run Last Test\18:TestLast<cr>\15<leader>nl\19Run Test Files\18:TestFile<cr>\15<leader>nf\19Run Test Suite\19:TestSuite<cr>\15<leader>ns\rnnoremap\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n×\3\0\0\a\0\25\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\0034\4\3\0005\5\t\0>\5\1\4=\4\n\0034\4\5\0005\5\v\0>\5\1\0045\5\f\0>\5\2\0045\5\r\0>\5\3\0045\5\14\0>\5\4\4=\4\15\0034\4\4\0005\5\16\0>\5\1\0044\5\3\0006\6\17\0>\6\1\5>\5\2\0045\5\18\0005\6\19\0=\6\20\5>\5\3\4=\4\21\3=\3\22\0025\3\23\0=\3\24\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rquickfix\bfzf\rsections\14lualine_x\fsources\1\2\0\0\rnvim_lsp\1\2\0\0\16diagnostics\26connected_lsp_clients\1\2\0\0\tdiff\14lualine_c\1\2\0\0\17fileencoding\1\2\0\0\15fileformat\1\2\0\0\rfiletype\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\1\0\tmode\nlower\1\foptions\1\0\0\1\0\1\ntheme\14palenight\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: committia.vim
time([[Config for committia.vim]], true)
try_loadstring("\27LJ\2\n„\2\0\0\4\0\6\0\v6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0+\3\2\0B\0\3\1K\0\1\0£\1            function! g:committia_hooks.edit_open(info)\n                setlocal spell\n                set colorcolumn=72\n            endfunction\n            \14nvim_exec\bapi\31let g:committia_hooks = {}\bcmd\bvim\0", "config", "committia.vim")
time([[Config for committia.vim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
