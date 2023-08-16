require("util")
local neogit = require("neogit")

neogit.setup({})

MapKeyN("<leader>mm", function() neogit.open({ kind = "auto" }) end)
MapKeyN("<leader>mc", function() neogit.open({ kind = "auto", "commit" }) end)
