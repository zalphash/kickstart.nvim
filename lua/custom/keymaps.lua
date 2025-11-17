-- [[ My personal keymaps ]]
--  See `:help vim.keymap.set()`

-- Change buffer
vim.keymap.set('n', '<leader>l', '<cmd>bnext<CR>', {
  noremap = true,
  silent = true,
  desc = 'Switch to Next buffer',
})
vim.keymap.set('n', '<leader>h', '<cmd>bprevious<CR>', {
  noremap = true,
  silent = true,
  desc = 'Switch to Previous buffer',
})
vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>', {
  noremap = true,
  silent = true,
  desc = 'Delete Current Buffer',
})
vim.keymap.set('n', '<leader>b!', '<cmd>bd!<CR>', {
  noremap = true,
  silent = true,
  desc = 'Force Delete Current Buffer',
})

-- Yank to the end of line
vim.keymap.set('n', 'Y', 'y$', {
  noremap = true,
  silent = true,
  desc = 'Yank to the end of line',
})

-- Yank into clipboard
vim.keymap.set('v', '<leader>y', [["+y]], {
  noremap = true,
  silent = true,
  desc = 'Yank into Clipboard',
})

-- Quickly select the last pasted text
vim.keymap.set('n', '<leader>gv', '`[v`]', {
  noremap = true,
  silent = true,
  desc = 'Select last pasted text',
})

-- Remain selected after indenting
vim.keymap.set('v', '<', '<gv', {
  noremap = true,
  silent = true,
  desc = 'Remain selected after indenting',
})
vim.keymap.set('v', '>', '>gv', {
  noremap = true,
  silent = true,
  desc = 'Remain selected after indenting',
})

-- Quickly return to normal mode
vim.keymap.set({ 'i', 'c', 't' }, 'jk', '<Esc>', {
  noremap = true,
  silent = true,
  desc = 'Quickly return to normal mode',
})

-- Smart j/k: use screen lines by default, physical lines with count prefix
vim.keymap.set({ 'n', 'x' }, 'j', [[v:count == 0 ? 'gj' : 'j']], {
  expr = true,
  silent = true,
  desc = 'Smart line movements based on count prefix',
})
vim.keymap.set({ 'n', 'x' }, 'k', [[v:count == 0 ? 'gk' : 'k']], {
  expr = true,
  silent = true,
  desc = 'Smart line movements based on count prefix',
})

-- Surround the selected word or block by ' or "
vim.keymap.set('v', "<leader>'", "<esc>`<i'<Esc>`>la'<Esc>", {
  noremap = true,
  silent = true,
  desc = "Surround the selected word or block by '",
})
vim.keymap.set('v', '<leader>"', '<Esc>`<i"<Esc>`>la"<Esc>', {
  noremap = true,
  silent = true,
  desc = 'Surround the selected word or block by "',
})
vim.keymap.set('n', "<leader>'", "viw<Esc>bi'<Esc>ea'<esc>", {
  noremap = true,
  silent = true,
  desc = "Surround the selected word or block by '",
})
vim.keymap.set('n', '<leader>"', 'viw<Esc>bi"<Esc>ea"<esc>', {
  noremap = true,
  silent = true,
  desc = 'Surround the selected word or block by "',
})

-- Substitute within selection only
vim.keymap.set('x', '<leader>s', ':<C-u>s/\\%V', {
  noremap = true,
  silent = false,
  desc = 'Substitute within selection only',
})

-- Replace the current word globally
vim.keymap.set('v', '<leader>rw', 'y:%s/<C-r>"//g<Left><Left>', {
  noremap = true,
  silent = false,
  desc = 'Replace the current word globally',
})
vim.keymap.set('n', '<leader>rw', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', {
  noremap = true,
  silent = false,
  desc = 'Replace the current word globally',
})

-- Change the current word globally
vim.keymap.set('v', '<leader>cw', 'y:%s/<C-r>"/<C-r>"/g<Left><Left>', {
  noremap = true,
  silent = false,
  desc = 'Change the current word globally',
})
vim.keymap.set('n', '<leader>cw', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>', {
  noremap = true,
  silent = false,
  desc = 'Change the current word globally',
})

-- Edit current register content, usage: "q<leader>em to edit register q
vim.keymap.set('n', '<leader>em', ':<C-u><C-r><C-r>="let @". v:register ." = ". string(getreg(v:register))<CR><Left>', {
  noremap = true,
  silent = false,
  desc = 'Edit current register content',
})

-- vim: ts=2 sts=2 sw=2 et
