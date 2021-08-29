-- thanks to https://dev.to/vonheikemen/creating-a-lua-interface-for-minpac-1jd2
local M = {}

M.add = function(name, opts)
  opts = opts or vim.empty_dict()

  -- "do" is a keyword in lua.
  -- We make a "run" alias to save ourselves some troubles
  opts['do'] = opts.run
  opts.run = nil

  vim.call('minpac#add', name, opts)
end

-- The setup
M.init = function(opts)
  opts = opts or vim.empty_dict()
  vim.cmd('packadd minpac')
  vim.call('minpac#init', opts)
end

-- The heavy lifting happens here
M.run = function(action)
  -- Higher order functions FTW!
  M.use(M.add)
  vim.call(action)
end

M.setup_commands = function()
  vim.cmd [[
    command! PackUpdate lua require('usermod.minpac').run('minpac#update')
    command! PackStatus lua require('usermod.minpac').run('minpac#status')
    command! PackClean  lua require('usermod.minpac').run('minpac#clean')
  ]]
end

-- Just know that if you use `require` this will only be executed once.
-- Regardless, nothing bad will happens if you run this again.
M.setup_commands()

return M
