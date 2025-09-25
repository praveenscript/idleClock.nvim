# idleClock.nvim

A minimal Neovim plugin that tracks how long you've been idle — because time slips quietly, and I needed to see it.

## ✨ Features

- Floating timer UI in the top-right corner
- Live updates every few seconds

## 📦 Installation

### Lazy.nvim

```lua
{
  "praveenscript/idleClock.nvim",
  config = function()
    require("idleClock").setup()
  end,
}
```

I'll update the config options later, I just created the readme by chatgpt so it's not reliable