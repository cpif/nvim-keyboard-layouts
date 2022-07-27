--[[
Note from vim.keymap.set helpfile:

{mode}  Mode short-name (map command prefix: "n", "i",
        "v", "x", …) or "!" for |:map!|, or empty string
        for |:map|.
]]

function keymap(keytable)
  for i, map in ipairs(keytable.commands) do
    vim.keymap.set('', map.colemak, map.qwerty)
  end
  for i, map in ipairs(keytable.operators) do
    vim.keymap.set('o', map.colemak, map.qwerty)
  end
end

colemakkeytable = {
  commands = {
    { qwerty = ':', colemak = 'O' },
    { qwerty = ';', colemak = 'o' },
    { qwerty = 'D', colemak = 'S' },
    { qwerty = 'd', colemak = 's' },
    { qwerty = 'E', colemak = 'F' },
    { qwerty = 'e', colemak = 'f' },
    { qwerty = 'F', colemak = 'T' },
    { qwerty = 'f', colemak = 't' },
    { qwerty = 'G', colemak = 'D' },
    { qwerty = 'g', colemak = 'd' },
    { qwerty = 'I', colemak = 'U' },
    { qwerty = 'i', colemak = 'u' },
    { qwerty = 'J', colemak = 'N' },
    { qwerty = 'j', colemak = 'n' },
    { qwerty = 'K', colemak = 'E' },
    { qwerty = 'k', colemak = 'e' },
    { qwerty = 'L', colemak = 'I' },
    { qwerty = 'l', colemak = 'i' },
    { qwerty = 'N', colemak = 'K' },
    { qwerty = 'n', colemak = 'k' },
    { qwerty = 'O', colemak = 'Y' },
    { qwerty = 'o', colemak = 'y' },
    { qwerty = 'P', colemak = ':' },
    { qwerty = 'p', colemak = ';' },
    { qwerty = 'R', colemak = 'P' },
    { qwerty = 'r', colemak = 'p' },
    { qwerty = 'S', colemak = 'R' },
    { qwerty = 's', colemak = 'r' },
    { qwerty = 'T', colemak = 'G' },
    { qwerty = 't', colemak = 'g' },
    { qwerty = 'U', colemak = 'L' },
    { qwerty = 'u', colemak = 'l' },
    { qwerty = 'Y', colemak = 'J' },
    { qwerty = 'y', colemak = 'j' },
  },
  operators = {
    -- in operators
    { qwerty = 'i"', colemak = 'u"' },
    { qwerty = 'i(', colemak = 'u(' },
    { qwerty = 'i)', colemak = 'u)' },
    { qwerty = 'i<', colemak = 'u<' },
    { qwerty = 'i>', colemak = 'u>' },
    { qwerty = 'iB', colemak = 'uB' },
    { qwerty = 'ib', colemak = 'ub' },
    { qwerty = 'ip', colemak = 'u;' },
    { qwerty = 'is', colemak = 'ur' },
    { qwerty = 'it', colemak = 'ug' },
    { qwerty = 'iW', colemak = 'uW' },
    { qwerty = 'iw', colemak = 'uw' },
    { qwerty = 'i[', colemak = 'u[' },
    { qwerty = 'i]', colemak = 'u]' },
    { qwerty = 'i`', colemak = 'u`' },
    { qwerty = 'i{', colemak = 'u{' },
    { qwerty = 'i}', colemak = 'u}' },
    { qwerty = 'i\'', colemak = 'u\'' },
    -- all operators
    { qwerty = 'ap', colemak = 'a;' },
    { qwerty = 'as', colemak = 'ar' },
    { qwerty = 'at', colemak = 'ag' },
  },
}
