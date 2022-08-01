-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- use 'davidhalter/jedi-vim'
  use "jose-elias-alvarez/null-ls.nvim"
  use "tpope/vim-surround"
  use "nvim-lualine/lualine.nvim"
  use "ellisonleao/gruvbox.nvim"
  use "nvim-lua/plenary.nvim"
end)
