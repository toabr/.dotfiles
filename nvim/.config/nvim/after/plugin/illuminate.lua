local status_ok, illu = pcall(require, "illuminate")
if not status_ok then
  return
end

vim.keymap.set( "n", "<a-n>", illu.goto_next_reference, { desc = "Illuminate - goto_next" })
vim.keymap.set( "n", "<a-p>", illu.goto_prev_reference, { desc = "Illuminate - goto_prev" })
vim.keymap.set( "n", "<leader>ui", illu.toggle, { desc = "[i]lluminate" })

illu.configure {
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  delay = 200,
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "alpha",
    "NvimTree",
    "packer",
    "neogitstatus",
    "Trouble",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "TelescopePrompt",
  },
}
