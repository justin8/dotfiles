return {
  "folke/flash.nvim",
  keys = {
    -- disable the default 's' key
    { "s", false },
    -- optionally rebind Flash to another key (e.g., <leader>s)
    {
      "<leader>F",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
  },
}
