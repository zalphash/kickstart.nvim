-- bigfile.nvim
-- https://github.com/LunarVim/bigfile.nvim

return {
  'LunarVim/bigfile.nvim',
  event = { 'FileReadPre', 'BufReadPre', 'User FileOpened' },
}

-- vim: ts=2 sts=2 sw=2 et
