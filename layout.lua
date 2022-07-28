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

--[[ Preamble: what is this?                                  {{{

Vim users love to talk about "muscle memory." With time -- so the
theory goes -- you will effortlessly navigate your text files,
hopping to the top of the file with `gg` and deleting a line with
`dd`.

But what are you supposed to do if you try a different keyboard
layout? Is "delete a line" burned into your brain as "middle
finger of my left hand on the home row" or as "the letter 'd'
(wherever it is) two times"?

The "vim community" seems to be split on this issue. Some users
want to type `dd` for "delete a line" even if the `d` key lives
somewhere else. But to my thinking, as a veteran qwerty user, I'd
rather retain the muscle memory: "To delete a line, give the
middle finger to it twice."

So I made this script to programatically map everything I could
think of to what it would be on a qwerty keyboard, even if you're
using an alternate layout like Colemak or Dvorak. Most of the
code I found on GitHub is not this comprehensive: for example, a
Colemak user will map `hnei` to `hjkl` and that's it. If that's
your preference, it's not hard to find. But my script attempts to
remap *everything*: if you type `das` to delete a sentence, your
muscle memory will kick in.

At the top of this file, you'll see the variable
"mykeyboardlayout," which is set to a multiline string (the
default is Colemak). If you'd like to try this out, all you have
to do is replace the contents of that variable with your desired
keyboard layout. Then, in your `init.lua` file, add the following:

```
require('remapkb')
remapkb()
```

Obviously, you could also call `remapkb()` somewhere else, too.
Map it to `<leader>m` perhaps?

I think I probably fucked something up somewhere. Pull requests
are welcome -- please help me fix this!

--}}}]]

function remapkb()
  qwerty    = '1234567890-=qwertyuiop[]\\asdfghjkl;\'zxcvbnm,./'
            .. '!@#$%^&*()_+QWERTYUIOP{}|ASDFGHJKL:"ZXCVBNM<>?'
  newlayout = string.gsub(mykeyboardlayout, '\n', '')
  keytable  = createkeytable(newlayout, qwerty)
  commandkeymap(keytable)
  operatorkeymap(keytable)
end

function createkeytable(newlayout, qwerty)
  local keytable = {}
  if testlayoutsize(newlayout) then
    for i=1, string.len(newlayout) do
      keytable[i] = {
        qwerty = string.sub(qwerty, i, i),
        new    = string.sub(newlayout, i, i),
      }
    end
  end
  return keytable
end

function commandkeymap(keytable)
  for i, map in ipairs(keytable) do
    vim.keymap.set('', map.new, map.qwerty)
  end
end

function operatorkeymap(keytable)
  local textobjects = 'wWsp][)(b><t}{B"\'`'
  local selectall = string.sub(newlayout, 26, 26)
  local selectin  = string.sub(newlayout, 20, 20)
  for i, obj in ipairs(keytable) do
    if string.find(textobjects, '[[' .. obj.qwerty .. ']]') ~= nil then
      vim.keymap.set('o', selectall .. obj.new, 'a' .. obj.qwerty)
      vim.keymap.set('o', 'a' .. obj.qwerty, '')
      vim.keymap.set('o', selectin .. obj.new, 'i' .. obj.qwerty)
      vim.keymap.set('o', 'i' .. obj.qwerty, '')
    end
  end
end

function testlayoutsize(layout)
  if string.len(layout) > 92 then
    print('There are too many characters in your keyboard layout!')
    return false
  elseif string.len(layout) < 92 then
    print('There are not enough characters in your keyboard layout!')
    return false
  else return true
  end
end
