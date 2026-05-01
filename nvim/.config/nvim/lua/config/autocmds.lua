-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Give the autocommand group a descriptive name
local augroup = vim.api.nvim_create_augroup("UserCustomAuGroup", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  -- You can be specific with patterns, e.g., "markdown,text,gitcommit"
  -- Or use "*" to disable it for all file types
  pattern = "*",
  callback = function()
    vim.opt.spell = false
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup,
  pattern = "*",
  callback = function()
    if vim.fn.argc() > 0 and vim.fn.filereadable(vim.fn.argv(0)) == 1 then
      vim.cmd("cd %:h")
    end
  end,
})

-- Save the original handler so we can call it later
local original_handler = vim.lsp.handlers["textDocument/documentHighlight"]

-- Override the handler
vim.lsp.handlers["textDocument/documentHighlight"] = function(err, result, ctx, config)
  -- 1. Check if we are in a TypeScript buffer
  local ft = vim.bo[ctx.bufnr].filetype
  if ft == "typescript" or ft == "typescriptreact" then
    -- 2. Try to get the Treesitter node under the cursor
    local ok, node = pcall(vim.treesitter.get_node)

    if ok and node then
      local node_type = node:type()

      -- 3. If the cursor is on any type of string, SUPPRESS the highlight
      if
        node_type == "string"
        or node_type == "string_fragment"
        or node_type == "template_string"
        or node_type == "no_substitution_template_literal"
      then
        -- Return early => Don't draw the highlight!
        return
      end
    end
  end

  -- 4. If we passed the checks, draw the highlight normally
  original_handler(err, result, ctx, config)
end
