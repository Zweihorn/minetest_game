
# Internationalization Lib for default game mods of the Minetest game

This is 'game_intllib' by [snoopy (Zweihorn)] 2019-05-07
[Fork from 'intllib' by Diego Martínez (kaeza).]
Released under (LGPLv2.1+). See `LICENSE.md` or `license.txt` for details.

'game_intllib' is an attempt at providing internationalization support 
for the default game mods only.

This 'game_intllib' internal mod is specifially aimed at default mods 
internal to the game in the 'minetest_game' folder. 

The original 'intllib' mod is an attempt at providing internationalization 
support for external mods (something Minetest currently lacks).

Should you have any comments/suggestions, please post them in the
[forum topic][topic]. For bug reports, use the [bug tracker][bugtracker]
on Github.

## How to use 'intllib' (the original mod)

If you are a regular player looking for translated texts of mods, just
[install][installing_mods] the original 'intllib' mod like any other 
one, then enable it in the GUI of the MT client.

## How to use 'game_intllib' (this mod specifically)

The use of this mod is at the deliberations of the Minetest game devs.

The mod tries to detect your language, but since there's currently no
portable way to do this, it tries several alternatives:

* `language` setting in `minetest.conf`.
* `LANGUAGE` environment variable.
* `LANG` environment variable.
* If all else fails, uses `en`.

In any case, the end result should be the [ISO 639-1 Language Code][ISO639-1]
of the desired language.

### Mod developers

If you are a mod developer looking to add internationalization support to
your mod, please use the original 'intllib' mod and see `doc/developer.md`.

### Translators

If you are a translator, see `doc/translator.md`.

[topic]: https://forum.minetest.net/viewtopic.php?id=4929
[bugtracker]: https://github.com/minetest-mods/intllib/issues
[installing_mods]: https://wiki.minetest.net/Installing_mods
[ISO639-1]: https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
