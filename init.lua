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
  { "elixir-editors/vim-elixir" },
  { 'overcache/NeoSolarized' },
  { 'github/copilot.vim' },
--- make things a bit Luan's vim-ier
  { 'ctrlpvim/ctrlp.vim' }
}

require("lazy").setup(plugins)

vim.cmd('source ~/workspace/workstation/init.vim')
