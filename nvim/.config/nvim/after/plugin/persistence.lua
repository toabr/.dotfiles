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

vim.keymap.set('n', "<leader>qs", function() require("persistence").load() end, { desc = "restore [s]ession" })
vim.keymap.set('n', "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "[l]ast session" })
vim.keymap.set('n', "<leader>qd", function() require("persistence").stop() end, { desc = "[d]on't save" })

require('persistence').setup {
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  module = "persistence",
  opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
}

