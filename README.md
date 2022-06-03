# spoon.nvim

A collection of smart luasnip snippets.

## Table of Content

* [Motivation](#motivation)
* [Supported Languages](#supported-languages)
* [Installation](#installation)
* [Configuration](#configuration)
* [TODO](#todo)

## Motivation

Although there are a good plenty of snippet plugins to use, none of them
satisfied me. I wanted something that uses all luasnip capabilities to enable
me to be my most productive.

Hopefully this plugin will achieve its goal and become the most efficient
snippet collection ever!

## Supported Languages

* General Snippets aka `all` (available everywhere)
* Lua
* JavaScript
* JavaScript React

## Installation

vim-plug:

```vimscript
Plug 'l3mon4d3/luasnip'
Plug 'utilyre/spoon.nvim'
```

packer.nvim:

```lua
use {
  "utilyre/spoon.nvim",
  requires = { "l3mon4d3/luasnip" },
}
```

## Configuration

```lua
local spoon = require("spoon.nvim")

spoon.setup({
  langs = {
    all = true,
    lua = true,
    javascript = true,
  },
})
```

## TODO

* [x] An option to either use single quotes or double quotes in snippets
* [ ] Language specific configuration

**Note:** There are so many languages out there and I'm no expert in those, so
any help is appreciated. 🤝

I'm currently working on:

1. JavaScript
2. Lua
