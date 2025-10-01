# idleClock.nvim

A minimal Neovim plugin that tracks how long you've been idle — because time slips quietly, and I needed to see it.

#### How it works?
Basically, like after specific time (30seconds) or more, it shows the time you've been idle, I'll allow options to config this later, as of default it does a refresh of 6 seconds, just so it doesn't get your attention enough, though I'll add the option for that as well


### Warning
I'm new in coding so uh I can mess things up

## ✨ Features

- Floating timer UI in the top-right corner
- Live updates every few seconds

## 📦 Installation

### Lazy.nvim

Below is the default Config

```lua
{
  "pravyhn/idleClock.nvim",
  config = function()
    require("idleClock").setup()
  end,
}
```

Here is how you can add your own

```lua
opts = {
   idleTimeLimit = 30 -- Default is 30, ex: after 30 seconds the clock will show itself
}
```

I'll update the config options later, I just created the readme by chatgpt so it's not reliable
