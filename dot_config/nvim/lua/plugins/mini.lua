return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - msaiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - msd'   - [S]urround [D]elete [']quotes
    -- - msr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup {
      mappings = {
        add = 'msa', -- Add surrounding in Normal and Visual modes
        delete = 'msd', -- Delete surrounding
        find = 'msf', -- Find surrounding (to the right)
        find_left = 'msF', -- Find surrounding (to the left)
        highlight = 'msh', -- Highlight surrounding
        replace = 'msr', -- Replace surrounding
        update_n_lines = 'msn', -- Update `n_lines`
      },
    }

    require('mini.pairs').setup()
  end,
}
