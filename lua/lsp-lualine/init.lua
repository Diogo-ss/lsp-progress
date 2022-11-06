local function lsp_progress()
	local icon = ': '
	local n_msg = 'No LSP'
    local msg = string.format("%s %s", icon, n_msg)
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return string.format("%s %s",icon, client.name)
      end
    end
    return msg
  end

print("%s", lsp_progress)

