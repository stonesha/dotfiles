require("barbar").setup({})

vim.keymap.set("n", "<leader>bn", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bc", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>br", "<Cmd>BufferRestore<CR>", { noremap = true, silent = true })
