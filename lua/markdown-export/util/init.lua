local M = {}

M.is_saved = function()
  return not vim.bo[vim.api.nvim_get_current_buf()].modified
end

M.is_md_file = function()
  return vim.bo.filetype == "markdown"
end

return M
