--------------------------------------------------------------------------------
-- goolord/alpha-nvim
--------------------------------------------------------------------------------

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"

local logo = {
  type = 'text',
  val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  },
  opts = {
    position = 'center',
    hl = 'String',
  },
}

local function info_value()
  local date = os.date("  %d/%m/%Y ")
  local time = os.date("  %H:%M:%S ")
  local plugins = "  " .. #vim.tbl_keys(packer_plugins) .. " plugins "

  local v = vim.version()
  local version = "  v" .. v.major .. "." .. v.minor .. "." .. v.patch

  return date .. time .. plugins .. version
end

local info = {
  type = 'text',
  val = info_value(),
  opts = {
    hl = 'Comment',
    position = 'center',
  },
}

local header = {
  type = 'group',
  val = {
    logo,
    { type = 'padding', val = 1 },
    info,
  },
}

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "SpecialComment"
  b.opts.hl_shortcut = "Statement"
  return b
end

local buttons = {
  type = 'group',
  val = {
    {
      type = 'text',
      val = '---   Actions   ---',
      opts = {
        hl = 'String',
        shrink_margin = false,
        position = 'center',
      },
    },
    { type = 'padding', val = 1 },
    button("e", " " .. " New", "<CMD>ene <BAR> startinsert <CR>"),
    button("f", " " .. " Find", "<CMD>Telescope find_files hidden=true<CR>"),
    button("p", " " .. " Projects", "<CMD>lua require('telescope').extensions.projects.projects()<CR>"),
    button("r", " " .. " Recent", "<CMD>Telescope oldfiles <CR>"),
    button("g", " " .. " Grep", "<CMD>Telescope live_grep <CR>"),
    button("c", " " .. " Config", "<CMD>e $MYVIMRC <CR>"),
    button("q", " " .. " Quit", "<CMD>qa<CR>"),
  },
  opts = {
    position = 'center',
    spacing = 0,
  },
}

local footer = {
  type = 'text',
  val = {
    [[---   The brain is for having ideas   ---]],
    [[---       not for storing them.       ---]],
  },
  opts = {
    position = 'center',
    hl = 'Type',
  },
}
local config = {
  layout = {
    { type = 'padding', val = 5 },
    header,
    { type = 'padding', val = 3 },
    buttons,
    { type = 'padding', val = 3 },
    footer,
  },
  opts = {
    margin = 5,
  },
}

alpha.setup(config)
