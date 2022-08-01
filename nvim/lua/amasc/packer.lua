-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'junegunn/seoul256.vim'
  use 'davidhalter/jedi-vim'
  use 'tpope/vim-surround'
  use 'nvim-lualine/lualine.nvim'
  use "ellisonleao/gruvbox.nvim"
end)
