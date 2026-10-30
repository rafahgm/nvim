-- center picker
local win_config = function()
  local height = math.floor(0.4 * vim.o.lines)
  local width = math.floor(0.6 * vim.o.columns)

  return {
    anchor = "NW",
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

-- shorten long file paths
local shorten_path = function(path)
  local parts = vim.split(path, "/", { plain = true })

  if #parts <= 3 then
    return path
  end

  return table.concat({
    parts[1],
    "...",
    parts[#parts - 1],
    parts[#parts],
  }, "/")
end

-- show files with shortened paths
local show_files = function(buf_id, items, query, opts)
  items = vim.tbl_map(function(path)
    return {
      path = path,
      text = shorten_path(path),
    }
  end, items)
  
  MiniPick.default_show(buf_id, items, query, opts)
end

-- setup
require("mini.pick").setup({
  window = {
    config = win_config,
    style = "minimal",
  },
  mappings = {
    move_down = "<C-j>",
    move_up = "<C-k>",
    toggle_preview = "<C-p>",
    mark = "<Tab>",
    choose_marked = "<C-q>"
  },
})

require("mini.extra").setup()

-- Find files
vim.keymap.set("n", "<leader>sf", function()
  MiniPick.builtin.files({ tool = "rg" }, {
    source = { show = show_files },
  })
end, { silent = true })

vim.keymap.set("n", "<leader>sk", function()
  MiniExtra.pickers.keymaps()
end, { silent = true })
