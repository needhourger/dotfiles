-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/yuuki/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?.lua;/home/yuuki/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?/init.lua;/home/yuuki/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?.lua;/home/yuuki/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/yuuki/.cache/nvim/packer_hererocks/2.1.1702233742/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["SmoothCursor.nvim"] = {
    cond = { "return not vim.g.vscode" },
    config = { "\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\nfancy\1\0\1\venable\2\1\0\1\ttype\fdefault\nsetup\17smoothcursor\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yuuki/.local/share/nvim/site/pack/packer/opt/SmoothCursor.nvim",
    url = "https://github.com/gen740/SmoothCursor.nvim"
  },
  ["bufferline.nvim"] = {
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yuuki/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["coc.nvim"] = {
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yuuki/.local/share/nvim/site/pack/packer/opt/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["lualine.nvim"] = {
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yuuki/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["modes.nvim"] = {
    cond = { "return not vim.g.vscode" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nmodes\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yuuki/.local/share/nvim/site/pack/packer/opt/modes.nvim",
    url = "https://github.com/mvllow/modes.nvim"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yuuki/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/yuuki/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["statuscol.nvim"] = {
    cond = { "return not vim.g.vscode" },
    config = { "\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vsetopt\2\nsetup\14statuscol\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yuuki/.local/share/nvim/site/pack/packer/opt/statuscol.nvim",
    url = "https://github.com/luukvbaal/statuscol.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/yuuki/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Conditional loads
time([[Conditional loading of SmoothCursor.nvim]], true)
  require("packer.load")({"SmoothCursor.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of SmoothCursor.nvim]], false)
time([[Conditional loading of bufferline.nvim]], true)
  require("packer.load")({"bufferline.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of bufferline.nvim]], false)
time([[Conditional loading of statuscol.nvim]], true)
  require("packer.load")({"statuscol.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of statuscol.nvim]], false)
time([[Conditional loading of coc.nvim]], true)
  require("packer.load")({"coc.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of coc.nvim]], false)
time([[Conditional loading of lualine.nvim]], true)
  require("packer.load")({"lualine.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lualine.nvim]], false)
time([[Conditional loading of modes.nvim]], true)
  require("packer.load")({"modes.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of modes.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
