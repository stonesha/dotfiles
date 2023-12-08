vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
require("neo-tree").setup({
    default_component_configs = {
        file_size = {
            enable = true,
            required_width = 64,
        },
        type = {
            enable = true,
            required_width = 122,
        },
        last_modified = {
            enable = true,
            required_width = 88,
        },
        created = {
            enable = true,
            required_width = 110,
        },
        symlink_target = {
            enable = false,
        },
    },
    filesystem = {
        filtered_items = {
            visible = true,
        },
        hijack_netrw_behavior = "open_current"
    }
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", {desc = "Toggle Neotree [e]xplorer"})
vim.keymap.set("n", "<leader>o", function () 
    if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
    else
        vim.cmd.Neotree "focus"
    end
end, {desc = "Focus Neotree"})

