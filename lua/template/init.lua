local M = {}

local function open_markdown(path)
  local buf = vim.fn.bufnr(path, true)
  vim.fn.bufload(buf)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.fn.readfile(path))
  vim.api.nvim_buf_set_option(buf, 'modified',  false)
  vim.api.nvim_buf_set_option(buf, 'filetype',  'markdown')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf, 'buflisted', false)

  local w  = math.floor(vim.o.columns * 0.75)
  local h  = math.floor(vim.o.lines   * 0.75)
  local row = math.floor((vim.o.lines   - h) / 2)
  local col = math.floor((vim.o.columns - w) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    style    = 'minimal',
    border   = 'rounded',
    width    = w,
    height   = h,
    row      = row,
    col      = col,
  })
end

function M.template()
    open_markdown("README.md")
end

return M
