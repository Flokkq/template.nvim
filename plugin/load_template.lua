vim.api.nvim_create_user_command('Template', function()
  require('template').template()
end, {
    desc = 'Start template plugin'
})

vim.keymap.set("n", "<leader>ts", "<Cmd>Template<CR>", {
    silent = true,
    noremap = true,
    desc = 'Start template plugin',
})
