require("utils")
local options = require("plugins.lsp.options")
local typescript = require("plugins.lsp.typescript")
local java = require("plugins.lsp.java")
local emmet = require("plugins.lsp.emmet")

return TableConcat(options, typescript, emmet, java)
