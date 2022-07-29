# Using Non-Qwerty Keyboard Layouts in NeoVim

Vim users who change their keyboard layout to something like
Colemak -- but who have learned vim with a qwerty layout -- are
faced with a dilemma: relearn where all the normal-mode commands
are or do a whole bunch of remappings?

Personally, I prefer the idea that to delete a line, I give it
the middle finger on the home row twice -- even if the letter
under that finger is no longer `d`. And I don't want to do all
those remappings by hand -- which seems to be what most other
folks end up doing.

So I wrote this little script that programmatically maps
everything to where your muscles remember it being. No doubt it
has problems -- but I think they'd be easy for you to fix (or to
let me know about so I can fix them.

I've tried to make the script fairly "readable," so hopefully if
there are problems you can identify them yourself.

## Installing

I don't use or understand package managers and I refuse to, so
you can't install that way, but your work is fairly simple.

Put `remapkb.lua` in `~/.config/nvim/lua/` (or whatever the
fucked-up windows equivalent is). Open it, and you'll see this at
the top of the file:

```lua
mykeyboardlayout = [[
1234567890-=
qwfpgjluy;[]\
arstdhneio'
zxcvbkm,./

!@#$%^&*()_+
QWFPGJLUY:{}|
ARSTDHNEIO"
ZXCVBKM<>?
]]
```

As you'll hopefully notice, that's just every key you can press
in a standard Colemak keyboard layout. If you're using Dvorak
instead, just replace the contents of that variable with every
key, left-to-right, first without shift and then with shift.

After that, put this in your `init.lua` file:

```lua
require('remapkb')
remapkb()
```

Obviously, you could also do something like:

```lua
vim.keymap.set('n', '<leader>k', function()
  require('remapkb')
  remapkb()
end)
```

Or whatever.

I hope that works for you!
