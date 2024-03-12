local config = function()
  require('lualine').setup {
    options = {
      -- icons_enabled = false,
      theme = 'dracula',
      -- component_separators = '|',
      -- section_separators = '',
    },
  }
end



return {
  'nvim-lualine/lualine.nvim',
  config = config
}


