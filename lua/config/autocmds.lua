-- Remove the auto comments on new lines
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")


-- ############### Change between cpp and hpp ############### --
local function switch_source_header()
  local bufnr = vim.api.nvim_get_current_buf()
  local client = vim.lsp.get_clients({ bufnr = bufnr, name = "clangd" })[1]
  if not client then
    vim.notify("clangd is not attached", vim.log.levels.WARN)
    return
  end
  local params = vim.lsp.util.make_text_document_params(bufnr)
  client:request("textDocument/switchSourceHeader", params, function(err, result)
    if err or not result then
      vim.notify("No corresponding file found", vim.log.levels.INFO)
      return
    end
    vim.cmd.edit(vim.uri_to_fname(result))
  end, bufnr)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function(ev)
    vim.keymap.set("n", "<leader>o", switch_source_header,
      { buffer = ev.buf, desc = "Switch header/source" })
  end,
})



-- ############### LazyVim autocmds ############### --
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})
