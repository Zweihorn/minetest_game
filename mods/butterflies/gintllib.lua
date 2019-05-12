-- gintllib.lua
-- should be copied from ../game_intllib/lib/gintllib.lua   (2019-05-12)

-- Please note: This is for the default minetest_game mod tree only.
-- For external mods one should make use of the original inttlib mod  
-- without interference to the game_intllib mod and it's functions.

-- Fallback functions for when `game_intllib` is not installed.
-- Code released under ../gintllib/LICENSE.md    [snoopy (Zweihorn)]

-- Minetest Game Translation with 'game_intllib' (based on 'intllib')
-- Copyright (2019) The Minetest Core & Minetest Game Developers (LGPLv2.1+)

-- Fallback to handle a S("string") enclosure if not installed.

local function format(str, ...)
	local args = { ... }
	local function repl(escape, open, num, close)
		if escape == "" then
			local replacement = tostring(args[tonumber(num)])
			if open == "" then
				replacement = replacement..close
			end
			return replacement
		else
			return "@"..open..num..close
		end
	end
	return (str:gsub("(@?)@(%(?)(%d+)(%)?)", repl))
end

local gettext, ngettext

-- Hopefully, use make_gettext_pair from game_intllib if installed.

if minetest.get_modpath("game_intllib") then
  gettext, ngettext = gintllib.make_gettext_pair()
end

-- Fill in missing functions if game_intllib is not installed.

gettext = gettext or function(msgid, ...)
	return format(msgid, ...)
end

ngettext = ngettext or function(msgid, msgid_plural, n, ...)
	return format(n==1 and msgid or msgid_plural, ...)
end

return gettext, ngettext
