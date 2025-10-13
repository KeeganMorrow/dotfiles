-- => Keegan's init.lua
--------------------------------------------------------------------------------
-- => General Settings
--------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basic settings
vim.opt.history = 700
vim.opt.autoread = true
vim.opt.spell = true
vim.opt.spelllang = "en_us"

--------------------------------------------------------------------------------
-- => VIM user interface
--------------------------------------------------------------------------------
vim.opt.scrolloff = 7
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wildmenu = true
vim.opt.wildignore = "*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store"
vim.opt.ruler = true
vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.backspace = "eol,start,indent"
vim.opt.whichwrap:append("<,>,h,l")
vim.opt.mouse = "a"
vim.opt.inccommand = "nosplit"
vim.opt.pumblend = 20
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.foldcolumn = "1"
vim.opt.conceallevel = 0

--------------------------------------------------------------------------------
-- => Colors and Fonts
--------------------------------------------------------------------------------
vim.opt.termguicolors = true
vim.opt.encoding = "utf8"
vim.opt.fileformats = "unix,dos,mac"
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", space = "·" }

--------------------------------------------------------------------------------
-- => Files, backups and undo
--------------------------------------------------------------------------------
vim.opt.backup = true
vim.opt.writebackup = false
vim.opt.swapfile = false

--------------------------------------------------------------------------------
-- => Text, tab and indent related
--------------------------------------------------------------------------------
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.linebreak = true
vim.opt.textwidth = 500
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = true
vim.opt.colorcolumn = "80,100"
vim.opt.virtualedit = "all"

--------------------------------------------------------------------------------
-- => Diff and Completion
--------------------------------------------------------------------------------
vim.opt.diffopt = "filler,context:10,vertical"
vim.opt.completeopt = "menuone,noselect"

--------------------------------------------------------------------------------
-- => Grep configuration
--------------------------------------------------------------------------------
if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep"
    vim.opt.grepformat = "%f:%l:%c:%m"
elseif vim.fn.executable("ag") == 1 then
    vim.opt.grepprg = "ag --vimgrep $*"
    vim.opt.grepformat = "%f:%l:%c:%m"
elseif vim.fn.executable("ack") == 1 then
    vim.opt.grepprg = "ack -H --nocolor --nogroup"
end

--------------------------------------------------------------------------------
-- => Autocommands
--------------------------------------------------------------------------------
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Return to last edit position when opening files
augroup("RestoreCursor", { clear = true })
autocmd("BufReadPost", {
    group = "RestoreCursor",
    pattern = "*",
    callback = function()
        local line = vim.fn.line("'\"")
        if line > 0 and line <= vim.fn.line("$") then
            vim.cmd('normal! g`"')
        end
    end,
})

-- Auto unfold all on buffer open
augroup("AutoUnfold", { clear = true })
autocmd("BufWinEnter", {
    group = "AutoUnfold",
    pattern = "*",
    callback = function()
        vim.opt.foldlevel = 99
    end,
})

-- Filetype specific settings
augroup("FileTypeSettings", { clear = true })
autocmd("FileType", {
    group = "FileTypeSettings",
    pattern = "dts",
    callback = function()
        vim.opt_local.expandtab = false
    end,
})

autocmd("FileType", {
    group = "FileTypeSettings",
    pattern = "qf",
    callback = function()
        vim.opt_local.wrap = false
    end,
})

--------------------------------------------------------------------------------
-- => Key Mappings (Basic)
--------------------------------------------------------------------------------
local keymap = vim.keymap.set

-- Y behavior like D
keymap("n", "Y", "y$")

-- Clipboard operations
keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
keymap("n", "<leader>Y", '"+y$', { desc = "Copy to clipboard (EOL)" })
keymap({ "n", "v" }, "<leader>d", '"+d', { desc = "Delete to clipboard" })
keymap("n", "<leader>D", '"+D', { desc = "Delete to clipboard (EOL)" })
keymap({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
keymap({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from clipboard (before)" })

-- Window splits
keymap("n", "<leader>\\", ":vsplit<CR>", { desc = "Vertical split" })
keymap("n", "<leader>-", ":split<CR>", { desc = "Horizontal split" })

-- Terminal
keymap("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Buffer navigation
keymap("n", "j", "gj")
keymap("n", "k", "gk")
keymap("n", "<S-h>", "gT", { desc = "Previous tab" })
keymap("n", "<S-l>", "gt", { desc = "Next tab" })
keymap("n", "[b", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "]b", ":bprev<CR>", { desc = "Previous buffer" })

-- Tab management
keymap("n", "<leader>tc", ":tabnew<CR>", { desc = "New tab" })
keymap("n", "<leader>tm", ":tabmove<CR>", { desc = "Move tab" })
keymap("n", "<leader>tq", ":tabclose<CR>", { desc = "Close tab" })

-- Remap Q to run register q as a macro
keymap("n", "Q", "@q", { desc = "Execute macro q" })

-- Man page for current word
keymap("n", "<leader>k", ":Man<CR>", { desc = "Man page" })

--------------------------------------------------------------------------------
-- => Helper Functions
--------------------------------------------------------------------------------
-- Visual selection search
function _G.visual_selection_search(direction)
    local saved_reg = vim.fn.getreg('"')
    vim.cmd('normal! vgvy')
    local pattern = vim.fn.escape(vim.fn.getreg('"'), '\\/.*$^~[]')
    pattern = vim.fn.substitute(pattern, "\n$", "", "")

    if direction == "b" then
        vim.fn.search(pattern, "b")
    elseif direction == "f" then
        vim.fn.search(pattern)
    end

    vim.fn.setreg("/", pattern)
    vim.fn.setreg('"', saved_reg)
end

keymap("x", "*", ":<C-u>lua _G.visual_selection_search('f')<CR>", { silent = true })
keymap("x", "#", ":<C-u>lua _G.visual_selection_search('b')<CR>", { silent = true })

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { ctermbg = "NONE", bg = "NONE" })

--------------------------------------------------------------------------------
-- => OSC52 Clipboard
--------------------------------------------------------------------------------
vim.g.clipboard = {
    name = "OSC 52",
    copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
        ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
        ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
}

--------------------------------------------------------------------------------
-- => Load plugin configuration
--------------------------------------------------------------------------------
require("user.plugins")
require("user.mappings")
require("user.lsp")

--------------------------------------------------------------------------------
-- => Treesitter Folds
--------------------------------------------------------------------------------
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
