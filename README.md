# mlvwmrc
by Morgan Aldridge <morgant@makkintosshu.com>

## OVERVIEW

This a set of configuration files for Takashi HASEGAWA's [Macintosh-like Virtual Window Manager (MLVWM)](https://github.com/morgant/mlvwm) with the following goals:

- More accurate emulation of [System 7](https://en.wikipedia.org/wiki/System_7) and [MacOS 8](https://en.wikipedia.org/wiki/Mac_OS_8) User Interfaces
- A complete configuration out-of-the-box
- Well structured configuration files

MLVWM includes a very rudimentary set of rc ([run command](https://en.wikipedia.org/wiki/Run_commands)) files and requires a fair amount of customization to better emulate Macintosh operating systems' UI. Additionally, since it is generally no more than a hobbyist window manager, no appropriate structure for the rc files (esp. for individual applications), icons (i.e. pixmaps), etc. Last, but not least, I wanted to reduce the amount of configuration needed every time I configure MLVWM on a new workstation.

## PREREQUISITES

* `mlvwm`
* `xpm`
* `locale`
* `make`
* `unzip`
* `curl`
* ImageMagick
* `xdotool` (for `mlvwm-restart`)
* `gxmessage`
* [`maim`](https://github.com/naelstrof/maim) & [`slop`](https://github.com/naelstrof/slop) (for `mlvwm-screenshot`)

## USAGE

Run `make && make install` to install `.mlvwm/`, `.mlvwmrc`, and `bin/mlvwm-*` in your home directory, including downloading and/or converting appropriate icons.

## TESTING

It's a good idea to test your `mlvwm` configuration prior to attempting to use it as your default window manager for the first time or after making any changes. The easiest way to do this is using `Xephyr`. I do the following:

    Xephyr :32 -screen 1024x768 &
    DISPLAY=:32 mlvwm -debug

The above will run `mlvwm` in a window, so you can test within your existing environment and easily troubleshoot or kill it if something goes wrong.

## SUGGESTED ADDITIONAL CONFIGURATION

### GTK+ 3

Some of the included configurations are for GTK+ 3 applications which use [client-side decorations (CSD)](https://en.wikipedia.org/wiki/Client-side_decoration), resulting in window controls being included in the "header bar". These window controls already exist in the `mlvwm` window title bars, so are redundant and look out of place. They can be disabled by editing `~/.config/gtk-3.0/settings.ini` to set `gtk-decoration-layout` to a blank string (or [customize](https://docs.gtk.org/gtk3/property.Settings.gtk-decoration-layout.html) as you see fit), for example:

```
\[Settings\]
gtk-decoration-layout=""
```

### iDesk

Companion [iDesk](https://idesk.sourceforge.net/) configuration files are available via the [mlvwmrc-ideskrc](https://github.com/morgant/mlvwmrc-ideskrc) project.

## APPLICATIONS

Configurations for the following X11 applications are included:

* [0ad](https://play0ad.com/)
* [ARandR](https://christian.amsuess.com/tools/arandr/)
* [Audacity](https://www.audacityteam.org/)
* [Basilisk II](http://basilisk.cebix.net/)
* [Chromium](https://www.chromium.org/)
* [Claws Mail](https://claws-mail.org/)
* [Clementine](https://www.clementine-player.org/)
* [cool-retro-term](https://github.com/Swordfish90/cool-retro-term)
* [Firefox](https://www.getfirefox.com/)
* [Godot](https://godotengine.org/)
* [Gxmessage](https://trmusson.dreamhosters.com/programs.html#gxmessage)
* [HandBrake](https://handbrake.fr/)
* [Krita](https://krita.org/)
* [Links](http://links.twibright.com/)
* [Meld](http://meldmerge.org/)
* [mpv](https://mpv.io/)
* [NetSurf](https://www.netsurf-browser.org/)
* [PCManFM](https://en.wikipedia.org/wiki/PCMan_File_Manager)
* [QEMU](https://www.qemu.org/)
* [RetroArch](https://www.retroarch.com/)
* [Remmina](https://remmina.org/)
* [ScummVM](https://www.scummvm.org/)
* [VLC](https://www.videolan.org/vlc/)
* [Xarchiver](https://github.com/ib/xarchiver)
* Xcalc
* Xclock
* [Xephyr](https://www.freedesktop.org/wiki/Software/Xephyr/)
* Xload
* Xmag
* Xmessage
* [Xosview2](http://xosview.sourceforge.net/)
* Xterm
* [Xwf](https://github.com/morgant/xwf)
* [Zeal](https://zealdocs.org/)
* [Zutty](https://github.com/tomszilagyi/zutty)

## MENU EXTRAS

Configurations for the following X11 applications are included for use in the menu bar:

* [Gromit-MPX](https://github.com/bk138/gromit-mpx)
* [mlclock](https://github.com/morgant/mlclock)
* X11
* Xclock
* Xload
* [Xmem](https://git.sdf.org/bch/xmem)

Configurations for additional applications and utilities are also available from the following separate projects:

* [ffssb2mlvwmrc](https://github.com/morgant/ffssb2mlvwmrc)
* [OpenBSD APM (Advanced Power Management)](https://github.com/morgant/mlvwmrc-openbsd-apm)
* [Xosview2 mini graphs](https://github.com/morgant/mlvwmrc-xosview2)
* [x11vnc Menu Extra](https://github.com/morgant/mlvwmrc-x11vnc)
* [xpomodmenu](https://github.com/morgant/xpomodmenu) ([xpomod](https://github.com/phillbush/xpomod) Pomodoro Menu Extra)

### SYSTEM TRAY

MLVWM doesn't natively support the [System Tray Protocol](https://www.freedesktop.org/wiki/Specifications/systemtray-spec/), but standalone X11 system tray applications such as the following _can_ be swallowed into the menu bar. Unfortunately, we don't currently include configurations for these, so you'll have configure them yourself:

**IMPORTANT:** MLVWM currently has some [overdraw rendering issues when X11 applications which resize themselves are swallowed into the menu bar](https://github.com/morgant/mlvwm/issues/36), so you'll want to configure a fixed-size system tray.

* [stalonetray](https://kolbusa.github.io/stalonetray/)
* [trayer](https://github.com/sargon/trayer-srg)

## MLVWM-SPECIFIC SCRIPTS

A few `mlvwm`-specific scripts are included and installed in `~/bin/`. You should ensure that this directory is in your user's `PATH` environment variable.

### mlvwm-message

`mlvwm-message` is a wrapper around `gxmessage` and `xmessage` (both of which accept the same options), so that other `mlvwm`-specific scripts can use the former, if available, or fall back to the latter.

Usage:

```
mlvwm-message [ -buttons label1[:value1],label2[:value2], ... ] [ options ] message ...
```

Example:

```
mlvwm-message -title "Yo" -buttons "Goodbye:1,Hello:2" -default "Hello" "Hello, world!"
```

### mlvwm-alert

`mlvwm-alert` is a wrapper around `mlvwm-message` which displays an alert-style dialog with the provided title, message, and with a single "OK" button to dismiss it.

Usage:

```
mlvwm-alert title message
```

Example:

```
mlvwm-alert "WARNING!" "This message will self destruct..."
```

### mlvwm-confirm

`mlvwm-confirm` is a wrapper around `mlvwm-message` which displays a confirmation-style dialog with the provided title, message, and with two buttons to dismiss it: "OK" to confirm (exit status `0`) and "Cancel" to deny (exit status `1`).

Usage:

```
mlvwm-confirm title message
```

Example:

```
mlvwm-confirm "Shut Down" "Are you sure you want to shut down your computer now?"
```

### mlvwm-powerdown

`mlvwm-powerdown` is a wrapper around OS-specific commands to suspend/sleep, reboot/restart, or shut/power down the computer. It accepts a single option, either `-s` for suspend/sleep, `-r` for reboot/restart, or `-p` for power/shut down. For the `-r` & `-p` options, it utilizes `mlvwm-confirm` to prompt for confirmation before restarting or shutting down the computer.

This is primarily used to implement "Sleep", "Restart", and "Shutdown" menu items in the default "Special" menu.

Usage:

```
mlvwm-powerdown [ -s | -r | -p ]
```

Example:

```
mlvwm-powerdown -p
```

### mlvwm-restart

`mlvwm-restart`, unlike `mlvwm-powerdown`, is unrelated to the power state of the computer and is instead used to relaunch `mlvwm`, reloading configurations. It requires `xdotool` to trigger a special keyboard shortcut which is specified in the default configuration.

Usage:

```
mlvwm-restart
```

### mlvwm-screenshot

`mlvwm-screenshot` is a wrapper around `maim` which saves a date & time stamped PNG screenshot of the screen in the user's `~/Pictures/` directory. Optionally, by specifying the `-s` option, it will allow the user to select an area of the screen to be captured instead of the entire screen.

This is primarily used to implement the screenshots via keyboard shortcuts in the default configuration.

Usage:

```
mlvwm-screenshot [ -s ]
```

Example:

```
mlvwm-screenshot -s
```

## DATA STRUCTURE

MLVWM loads its configuration from `~/.mlvwmrc`, but to break configuration up into more logical and manageable chunks within a `~/.mlvwm/` directory. That directory contains its own `.mlvwmrc` file which `~/.mlvwmrc` gets symlinked to, and it takes advantage of the `Read` command (see [mlvwm/CONFIGURATION](https://github.com/morgant/mlvwm/blob/master/CONFIGURATION)) to import the remaining configuration files.

The current structure is:

    ~/
      .mlvwmrc -> .mlvwm/.mlvwmrc
      .mlvwm/
        .mlvwmrc
        .initrc
        .restartrc
        .Xdefaults
        MenuBar
        VirtualDesktops
        theme/
          System7
          MacOS8
          MacOS9
        MenuExtras/
          xload
          …
        apps/
          .AppManifest
          Xterm
          Xcalc
          …
        pixmap/
          *.xpm
        Xresources/
          xclock
          …
      bin/
        mlvwm-alert
        mlvwm-confirm
        mlvwm-message
        mlvwm-powerdown
        mlvwm-restart
        mlvwm-screenshot

### .mlvwmrc

The main `rc` file. It contains some important configuration settings & commands, esp. `IconPath`, but primarily loads other `rc` & configuration files. The active theme can be changed by editing the `Read .mlvwm/theme/System7` line to one of the other theme files.

### .initrc

Contains an `InitFunction` block which can be modified to run commands upon initialization of MLVWM.

### .restartrc

Contains a `RestartFunction` block which can be modified to run commands upon init or reload of MLVWM.

### .Xdefaults

Contains default X(7) resources, mostly `#include` lines which import individual application-specific X resources configurations found in `.mlvwm/Xresources/`. It simplifies the inclusion of all mlvwmrc X resources at once as the user can edit their own `~/.Xdefaults` to append the following line:

`#import ".mlvwm/.Xdefaults"`

Alternatively, once can manually merge them with their own configuration by running the following:

`xrdb -merge "$HOME/.mlvwm/.Xdefaults"`

### VirtualDesktops

Contains configuration settings for virtual desktops, incl. the number of virtual desktops (default is 1.)

### MenuBar

Contains the default menu bar configuration, including loading Menu Extras. If you want to enable/disable specific MenuExtras, this is currently the place to do it.

*Important*: the Apple menu is actually defined in the theme files as some theme-specific settings need to be applied during creation, incl. icons. For this reason, the theme files _must_ be loaded _before_ the default menu bar in `.mlvwmrc`.

### .AppManifest

Includes a `Read` command for each application-specific file in the `apps` directory. This is primarily to limit the complexity of the main `.mlvwmrc` file.

### CONTRIBUTING

I very much welcome requests, feedback, and improvements. Please see [CONTRIBUTING](CONTRIBUTING.md) for details as to how to contribute, as well as the style guide for mlvwmrc configuration files.

## SPECIAL THANKS

Many thanks to Takashi Hasegawa for creating [MLVWM](http://www2u.biglobe.ne.jp/~y-miyata/mlvwm.html) and Steffen Beyer for providing [Apple/Mac icons in .xpm format](http://web.archive.org/web/20191118161417/http://sb.fluomedia.org/macintosh/).

## LICENSE

_TBD_

[Xosview icon](https://www.iconfinder.com/icons/9548/xosview_icon) by Oxygen Team.
