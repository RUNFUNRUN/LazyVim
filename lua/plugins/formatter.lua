require("utils")
local typescript = require("plugins.formatter.typescript")
local java = require("plugins.formatter.java")

return TableConcat(typescript, java)
