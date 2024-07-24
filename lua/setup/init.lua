require("setup.remaps")
require("setup.set")
require("setup.lazy_init")
require("lazy").setup(
	"setup.plugin"
)
vim.cmd("colorscheme rose-pine")

local lsp_zero = require('lsp-zero')
require("mason").setup()
require("mason-lspconfig").setup()

require'lspconfig'.pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 119
                }
            }
        }
    }
}

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>p", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
