-- nvim-colorizer.lua
-- https://github.com/catgoose/nvim-colorizer.lua

return {
  'catgoose/nvim-colorizer.lua',
  events = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('colorizer').setup()
  end,
}

-- vim: ts=2 sts=2 sw=2 et
