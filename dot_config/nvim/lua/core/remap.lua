-- keeps cursor on line instead of end of appends
vim.keymap.set("n", "J", "mzJ`z")

-- half page jumps keep page in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-d>zz")

-- keep search term in middle of terminal
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "dd", '"_dd')
