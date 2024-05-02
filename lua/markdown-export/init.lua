local util = require("markdown-export.util")

local M = {}

local options = {
  stylesheet = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h") .. "/css/styles.css",
}

M.setup = function(opts)
  require("markdown-export.commands").setup(M)
  options = vim.tbl_deep_extend("force", options, opts or {})
end

M.export_html = function()
  if not util.is_saved() then
    vim.notify("Please save the current buffer before exporting.", vim.log.levels.WARN)
    return
  elseif not util.is_md_file() then
    vim.notify("Not a valid markdown file.", vim.log.levels.WARN)
    return
  end

  local out_file = vim.fn.fnameescape(vim.fn.expand("%:r")) .. ".html"
  local args = {
    "-s", -- Standalone
    "-f", -- Input file type
    "markdown",
    "-t", -- Output file type
    "html5",
    "-o", -- Output file path
    out_file,
    vim.fn.fnameescape(vim.fn.expand("%")), -- Input file path
    "-c", -- Css styles
    options.stylesheet,
    "--embed-resources",
    "--quiet",
  }
  local cmd = { "pandoc", unpack(args) }

  vim.fn.jobstart(cmd)

  vim.notify("Created HTML export at [" .. out_file .. "]")
end

M.export_pdf = function()
  vim.notify("PDF export is not implemented yet", vim.log.levels.WARN)

  -- if not util.is_saved() then
  --   vim.notify("Please save the current buffer before exporting.", vim.log.levels.WARN)
  --   return
  -- elseif not util.is_md_file() then
  --   vim.notify("Not a valid markdown file.", vim.log.levels.WARN)
  --   return
  -- end
end

return M
