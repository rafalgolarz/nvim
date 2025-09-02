local M = {}

local function git_branch_with_remote()
  local branch_handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
  if not branch_handle then return "" end
  local branch = branch_handle:read("*a")
  branch_handle:close()
  branch = branch:gsub("%s+", "")
  if branch == "" or branch == "HEAD" then
    return ""
  end

  local remote_handle = io.popen("git config --get branch." .. branch .. ".remote 2>/dev/null")
  local remote = ""
  if remote_handle then
    remote = remote_handle:read("*a") or ""
    remote_handle:close()
    remote = remote:gsub("%s+", "")
  end

  if remote == "" then
    return " " .. branch .. " "
  else
    return " " .. remote .. "/" .. branch .. " "
  end
end



function M.run()
  local base = require("nvchad.statusline." .. vim.g.nvchad_theme).run()
  return base .. git_branch()
end

return M
