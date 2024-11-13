return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')


      -- Search all keybindings
      vim.keymap.set('n', '<leader>sk', function()
        builtin.keymaps({
          modes = { 'n', 'i', 'v', 'x' }, -- Show normal, insert, visual mode bindings
          show_plug = false,  -- Don't show plugin code
          only_show_current_mode = false, -- Show all modes
          layout_config = {
            width = 0.95,
            preview_width = 0.6,
          }
        })
      end, { desc = 'Search All Keybindings' })

      -- Add this to your telescope config:
      vim.keymap.set('n', '<leader>sh', function()
        builtin.help_tags()
      end, { desc = 'Search Help Tags' })


      telescope.setup({
        defaults = {
          layout_strategy = 'horizontal',
          layout_config = {
            width = 0.95,
            preview_cutoff = 120,
            horizontal = {
              preview_width = function(_, cols, _)
                return math.floor(cols * 0.6)
              end,
            },
          },
        },
      })
    end,
  }
}