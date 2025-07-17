return {
  "ysmb-wtsg/in-and-out.nvim",
  keys = {
    {
      "<C-f>",
      function()
        require("in-and-out").in_and_out()
      end,
      mode = "i",
    },
  },
}
