return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end,
      desc = "Fuzzy find current file",
    },
  },
}
