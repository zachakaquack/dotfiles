require "nvchad.mappings"

local map = vim.keymap.set

map("i", "JJ", "<ESC>")

map("n", "<C-t>", function()
  require("nvchad.themes").open { style = "flat"}
end, {})

-- word count
map("n", "<leader>wc", "c<C-g>")

-- markdown complete
map("n", "<leader>mmdc", "md0f ;rx`d")
-- markdown incomplete
map("n", "<leader>mmdi", "md0fxr `d")

-- other stuff
-- wrap 'wor|d|'
map("n", "<leader>w'", "ciw''<ESC>P", { desc="Wrap 'Wor|d|'" })
map("v", "<leader>w'", "s''<ESC>P", { desc="Wrap 'Wor|d|'" })

-- wrap "wor|d|"
map("n", "<leader>w\"", "ciw\"\"<ESC>P", { desc="Wrap \"Wor|d|\"" })
map("v", "<leader>w\"", "s\"\"<ESC>P", { desc="Wrap \"Wor|d|\"" })

-- wrap {wor|d|}
map("n", '<leader>w{', "ciw{}<ESC>P", { desc="Wrap {Wor|d|}" })
map("v", '<leader>w{', "s{}<ESC>P", { desc="Wrap {Wor|d|}" })

-- wrap [wor|d|]
map("n", '<leader>w[', "ciw[]<ESC>P", { desc="Wrap [Wor|d|]" })
map("v", '<leader>w[', "s[]<ESC>P", { desc="Wrap [Wor|d|]" })

map("n", '<leader>w`', "ciw``<ESC>P", { desc="Wrap `Wor|d|`" })
map("v", '<leader>w`', "s``<ESC>P", { desc="Wrap `Wor|d|`" })

-- wrap f"{word|}|"
map("n", "<leader>wfs", 'ciwf""<ESC>i{}<ESC>Pf"i<ESC>', { desc="Wrap f\"{Word|}|\"" })
map("n", "<leader>wfs", 'sf""<ESC>i{}<ESC>Pf"i<ESC>', { desc="Wrap f\"{Word|}|\"" })
