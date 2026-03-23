return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        separator_style = 'thin',
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = false,

        custom_filter = function(buf_number, buf_numbers)
          -- filter out by buffer name
          if vim.fn.bufname(buf_number) ~= '*compilation*' then
            return true
          end
        end,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    }

    -- switcher maps
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
  end,
}
