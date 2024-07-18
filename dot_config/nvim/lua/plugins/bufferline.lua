return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
    { '<leader>bd', '<Cmd>BufferLineClose<CR>', desc = 'Delete Current Buffers' },
    { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete Other Buffers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
    { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
  },
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      always_show_bufferline = true,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
    vim.keymap.set('n', '<leader>bd', function(buf)
      buf = buf or 0
      buf = buf == 0 and vim.api.nvim_get_current_buf() or buf

      if vim.bo.modified then
        local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
        if choice == 0 or choice == 3 then -- 0 for <Esc>/<C-c> and 3 for Cancel
          return
        end
        if choice == 1 then -- Yes
          vim.cmd.write()
        end
      end

      for _, win in ipairs(vim.fn.win_findbuf(buf)) do
        vim.api.nvim_win_call(win, function()
          if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
            return
          end
          -- Try using alternate buffer
          local alt = vim.fn.bufnr '#'
          if alt ~= buf and vim.fn.buflisted(alt) == 1 then
            vim.api.nvim_win_set_buf(win, alt)
            return
          end

          -- Try using previous buffer
          local has_previous = pcall(vim.cmd, 'bprevious')
          if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
            return
          end

          -- Create new listed buffer
          local new_buf = vim.api.nvim_create_buf(true, false)
          vim.api.nvim_win_set_buf(win, new_buf)
        end)
      end
      if vim.api.nvim_buf_is_valid(buf) then
        pcall(vim.cmd, 'bdelete! ' .. buf)
      end
    end, { desc = 'Delete Buffer' })
  end,
}
