-- gintllib.lua
-- should be copied from ../game_intllib/lib/gintllib.lua   (2019-05-14)

-- Please note: This is for the default minetest_game mod tree only.
-- For external mods one should make use of the original inttlib mod  
-- without interference to the game_intllib mod and it's functions.

-- The MT 5 function minetest.get_translator may be a better solution.

-- Fallback functions for when `game_intllib` is not installed.
-- Code released under ../gintllib/LICENSE.md -- LGPLv2.1+

-- Minetest Game Translation with 'game_intllib' (based on 'intllib')
-- Copyright (2019) The Minetest Core & Minetest Game Developers

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

-- Check if game_intllib should be activated or not in first place.
-- The MT 5 function minetest.get_translator may be a better solution.

local setactive = false
local g = minetest.settings:get("game_intllib")
if g and g ~= "" then
	if g == "on" or g == "ON" then 
		setactive = true
	end
end

-- Use the MT function minetest.get_translator if game_intllib is off.

if not setactive then 

	gettext, ngettext = minetest.get_translator()

else

-- When possible use make_gettext_pair from game_intllib if installed.

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
end

return gettext, ngettext
