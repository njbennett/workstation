local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ 'github/copilot.vim' },
	{ 'AlexvZyl/nordic.nvim' },
	{ 'neovim/nvim-lspconfig' },
	--- make things a bit Luan's vim-ier
	{ 'ctrlpvim/ctrlp.vim' },
	{ 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
}

require("lazy").setup(plugins)

--- lspconfig
require 'lspconfig'.lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = { globals = { 'vim' } }
		}
	}
}

require 'lspconfig'.elmls.setup {}

--- fancy syntax highlighting
require 'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"css",
		"elm",
		"go",
		"html",
		"javascript",
		"lua"
	},
	highlight = { enable = true },
}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf })
	end,
})

-- Format on writes
vim.api.nvim_create_autocmd('BufWritePre', {
	buffer = vim.fn.bufnr(),
	callback = function()
		vim.lsp.buf.format({ timeout_ms = 3000 })
	end,
})

--- keybindings
local wk = require("which-key")
wk.register({
	f = {
		name = "file",                                -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
		g = { "<cmd>Telescope live_grep<cr>", "Full Text Search" }, -- create a binding with label
	},
}, { prefix = "<leader>" })

-- autosave
vim.opt.autowriteall = true

--- somehow, this stops Nvim from adding a tab
--- when it autoindents a line
--= in addition to the spaces its copying from the above line
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

--- set line numbers for pairing
vim.opt.number = true

--- enable syntax highlighting
vim.opt.syntax = "on"

--- enable 24-bit RGB colors
vim.opt.termguicolors = true

--- set the colorscheme
vim.cmd("colorscheme nordic")
