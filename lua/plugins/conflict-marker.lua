return {
  {
    "tronikelis/conflict-marker.nvim",
    opts = {
      highlights = true,
      on_attach = function(conflict)
        local map = function(key, fn, name)
          vim.keymap.set("n", key, fn, { buffer = conflict.bufnr, desc = name })
        end

        map("<leader>gC", "", "+git conflict")
        map("<leader>gCo", function()
          conflict:choose_ours()
        end, "Ours")
        map("<leader>gCt", function()
          conflict:choose_theirs()
        end, "Theirs")
        map("<leader>gCb", function()
          conflict:choose_both()
        end, "Both")
        map("<leader>gCn", function()
          conflict:choose_none()
        end, "None")

        local MID = "^=======$"

        map("[x", function()
          vim.cmd("?" .. MID)
        end, "Prev Conflict")

        map("]x", function()
          vim.cmd("/" .. MID)
        end, "Next Conflict")
      end,
    },
    init = function()
      require("conflict-marker").setup()
    end,
  },
}
