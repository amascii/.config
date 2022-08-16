-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "jose-elias-alvarez/null-ls.nvim"
  use "tpope/vim-surround"
  use "ellisonleao/gruvbox.nvim"
  use "nvim-lua/plenary.nvim"
end)
