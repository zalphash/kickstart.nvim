-- lualine.nvim
-- https://github.com/nvim-lualine/lualine.nvim

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    require('lualine').setup {
      options = {
        theme = 'tokyonight-night',
        refresh = {
          statusline = 127,
          tabline = 127,
          winbar = 127,
          refresh_time = 15,
          events = {
            'WinEnter',
            'BufEnter',
            'BufWritePost',
            'SessionLoadPost',
            'FileChangedShellPost',
            'VimResized',
            'Filetype',
            'CursorMoved',
            'CursorMovedI',
            'ModeChanged',
            'RecordingEnter',
            'RecordingLeave',
          },
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'diff',
          'diagnostics',
          {
            ---@diagnostic disable-next-line: undefined-field
            require('noice').api.status.mode.get,
            ---@diagnostic disable-next-line: undefined-field
            cond = require('noice').api.status.mode.has,
            color = { fg = '#ff9e64' },
          },
        },
        lualine_c = { 'filename', 'lsp_progress' },
        lualine_x = {
          {
            ---@diagnostic disable-next-line: undefined-field
            require('noice').api.status.command.get,
            ---@diagnostic disable-next-line: undefined-field
            cond = require('noice').api.status.command.has,
            color = { fg = '#ff9e64' },
          },
          {
            require('lazy.status').updates,
            cond = require('lazy.status').has_updates,
            --color = { fg = "#a89984" },
          },
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      tabline = {
        lualine_a = { 'tabs' },
        lualine_b = { 'buffers' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
