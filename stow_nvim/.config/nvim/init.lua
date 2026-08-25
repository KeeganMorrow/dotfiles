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
vim.opt.showmode = false
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
vim.opt.fileformats = "unix,dos,mac"
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", space = "·" }

--------------------------------------------------------------------------------
-- => Files, backups and undo
--------------------------------------------------------------------------------
vim.opt.backup = true
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.swapfile = false

--------------------------------------------------------------------------------
-- => Text, tab and indent related
--------------------------------------------------------------------------------
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.linebreak = true
vim.opt.textwidth = 0
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.colorcolumn = "80,100"
vim.opt.virtualedit = "block"

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

-- Keep timestamped backups in a readable mirror of each file's absolute path.
-- Restrict this to normal file buffers so plugin URIs (fugitive:, term:, etc.)
-- cannot create invalid backup directories.
local backup_root = vim.fn.expand("~/.vim_backup")
augroup("Backups", { clear = true })
autocmd("BufWritePre", {
    group = "Backups",
    pattern = "*",
    callback = function(args)
        local name = vim.api.nvim_buf_get_name(args.buf)
        if name == "" or vim.bo[args.buf].buftype ~= "" then
            return
        end

        local path = vim.fn.fnamemodify(name, ":p")
        if not path:match("^/") then
            return
        end

        local backup_dir = backup_root .. vim.fn.fnamemodify(path, ":h")
        vim.fn.mkdir(backup_dir, "p", 448) -- 0700
        vim.opt.backupdir = backup_dir
        vim.opt.backupext = "_" .. os.date("%Y-%m-%d-%H")
    end,
})

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

-- Auto-check for file changes when returning to Neovim
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    group = "RestoreCursor",
    callback = function()
        if vim.fn.mode() ~= "c" then
            vim.cmd("checktime")
        end
    end,
})

-- Filetype specific settings
augroup("FileTypeSettings", { clear = true })
autocmd("FileType", {
    group = "FileTypeSettings",
    pattern = { "c", "cpp", "cuda", "objc", "objcpp" },
    callback = function()
        vim.opt_local.cindent = true
    end,
})

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

-- Buffer navigation (respect counts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap("n", "<S-h>", "gT", { desc = "Previous tab" })
keymap("n", "<S-l>", "gt", { desc = "Next tab" })
keymap("n", "[b", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "]b", ":bprev<CR>", { desc = "Previous buffer" })

-- Tab management
keymap("n", "<leader>Tc", ":tabnew<CR>", { desc = "New tab" })
keymap("n", "<leader>Tm", ":tabmove<CR>", { desc = "Move tab" })
keymap("n", "<leader>Tq", ":tabclose<CR>", { desc = "Close tab" })

-- Remap Q to run register q as a macro
keymap("n", "Q", "@q", { desc = "Execute macro q" })

-- Man page for current word
keymap("n", "<leader>k", ":Man<CR>", { desc = "Man page" })

--------------------------------------------------------------------------------
-- => Helper Functions
--------------------------------------------------------------------------------
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
-- Bootstrap lazy.nvim
--------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------------------------------------
-- Setup lazy.nvim
--------------------------------------------------------------------------------
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
--------------------------------------------------------------------------------
-- => Load user configurations
--------------------------------------------------------------------------------
require("user.lsp")

--------------------------------------------------------------------------------
-- => Folding
--------------------------------------------------------------------------------
vim.opt.foldenable = true
vim.opt.foldlevel = 99
