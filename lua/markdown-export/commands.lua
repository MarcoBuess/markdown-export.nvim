local M = {}

M.setup = function(tbl)
    vim.api.nvim_create_user_command("MarkdownExport", function(fileType)
        if fileType.args == "html" then
            tbl.export_html()
        elseif fileType.args == "pdf" then
            tbl.export_pdf()
        end
    end, {
        nargs = 1,
        complete = function(_, _, _)
            return { "html", "pdf" }
        end,
    })
end

return M
