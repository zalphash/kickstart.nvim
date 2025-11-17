-- [[ My personal options ]]
-- See `:help vim.o` and `:help vim.opt`

-- Get OS name
local function get_os_name()
  ---@diagnostic disable-next-line: undefined-field
  if vim.loop and vim.loop.os_uname then
    ---@diagnostic disable-next-line: undefined-field
    local os_info = vim.loop.os_uname()
    return os_info.sysname:lower()
  end
  return 'linux'
end
local os_name = get_os_name()

-- Check if in an SSH session
local _is_ssh_session_cached = nil
local function is_ssh_session()
  if _is_ssh_session_cached == nil then
    local ssh_vars = {
      'SSH_CONNECTION',
      'SSH_CLIENT',
      'SSH_TTY',
    }
    for _, var in ipairs(ssh_vars) do
      if os.getenv(var) ~= nil then
        _is_ssh_session_cached = true
        return _is_ssh_session_cached
      end
    end
    _is_ssh_session_cached = false
  end
  return _is_ssh_session_cached
end

-- Get content from reg "
local function get_reg_lines()
  local content = vim.fn.getreg '"'
  if content == '' then
    return {}
  end
  return vim.split(content, '\n')
end

-- For macOS
if os_name == 'darwin' then
  vim.opt.mouse = 'a'
end

-- For linux
if os_name == 'linux' then
  vim.opt.mouse = ''
  vim.opt.clipboard:append 'unnamedplus'
  if is_ssh_session() then
    vim.g.clipboard = {
      name = 'OSC52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy '+',
        ['*'] = require('vim.ui.clipboard.osc52').copy '*',
      },
      paste = {
        ['+'] = get_reg_lines,
        ['*'] = get_reg_lines,
      },
    }
  end
end

-- For windows
if os_name == 'windows' then
  vim.opt.mouse = ''
end

-- vim: ts=2 sts=2 sw=2 et
