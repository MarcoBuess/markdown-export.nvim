local M = {}

local health = {
  start = vim.health.start or vim.health.report_start,
  ok = vim.health.ok or vim.health.report_ok,
  warn = vim.health.warn or vim.health.report_warn,
  error = vim.health.error or vim.health.report_error,
  info = vim.health.info or vim.health.report_info,
}

local requirements = {
  "pandoc",
  "wkhtmltopdf",
}

function M.check()
  health.start("markdown-export.nvim [general]")

  health.info("Neovim Version: v" .. vim.fn.matchstr(vim.fn.execute("version"), "NVIM v\\zs[^\n]*"))

  if vim.version().prerelease then
    health.warn("Neovim nightly is not officially supported and may have breaking changes")
  elseif vim.fn.has("nvim-0.8") == 1 then
    health.ok("Using stable Neovim >= 0.8.0")
  else
    health.error("Neovim >= 0.8.0 is required")
  end

  health.start("markdown-export.nvim [core utils]")
  for _, bin in ipairs(requirements) do
    if vim.fn.executable(bin) then
      health.ok("Found " .. bin .. " in PATH")
    else
      health.error("Could not find " .. bin .. " in PATH")
    end
  end
end

return M
