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

plugins = {
--- { "elixir-editors/vim-elixir" },
  { 'overcache/NeoSolarized' },
  { 'numkil/ag.nvim' },
  { 'neovim/nvim-lspconfig' },
--- make things a bit Luan's vim-ier
  { 'ctrlpvim/ctrlp.vim' }
}

require("lazy").setup(plugins)

--- lspconfig
require("lspconfig").elixirls.setup{
  cmd = { "language_server.sh" };
}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf })
  end,
})

--- set line numbers for pairing
vim.opt.number = true

--- enable syntax highlighting
vim.opt.syntax = "on"

--- enable 24-bit RGB colors
vim.opt.termguicolors = true

--- set the colorscheme
vim.cmd("colorscheme NeoSolarized")
