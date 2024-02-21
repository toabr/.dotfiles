--------------------------------------------------------------------------------
-- folke/persistence.nvim
--------------------------------------------------------------------------------

if not pcall(require, "persistence") then
  return
end
-- local status_ok, persistence = pcall(require, "persistence")
-- if not status_ok then
--     return
-- end

vim.keymap.set('n', "<leader>ss", function() require("persistence").load() end, { desc = "restore [s]ession" })
vim.keymap.set('n', "<leader>sl", function() require("persistence").load({ last = true }) end, { desc = "[l]ast session" })
vim.keymap.set('n', "<leader>sd", function() require("persistence").stop() end, { desc = "[d]on't save current session" })

require('persistence').setup {
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  module = "persistence",
  opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
}

