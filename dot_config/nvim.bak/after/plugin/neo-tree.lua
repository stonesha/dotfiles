-- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
require("neo-tree").setup({
	enable_git_status = true,
	enable_diagnostics = true,
	modified = {
		symbol = "[+]",
		highlight = "NeoTreeModified",
	},
	git_status = {
		symbols = {
			-- Change type
			added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
			modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
			deleted = "✖", -- this can only be used in the git_status source
			renamed = "󰁕", -- this can only be used in the git_status source
			-- Status type
			untracked = "",
			ignored = "",
			unstaged = "󰄱",
			staged = "",
			conflict = "",
		},
	},
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
		hijack_netrw_behavior = "open_current",
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree [e]xplorer" })
vim.keymap.set("n", "<leader>o", function()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd("p")
	else
		vim.cmd.Neotree("focus")
	end
end, { desc = "Focus Neotree" })
