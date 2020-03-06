# mlvwmrc
by Morgan Aldridge <morgant@makkintosshu.com>

## OVERVIEW

This a set of configuration files for Takashi HASEGAWA's [Macintosh-like Virtual Window Manager (MLVWM)](http://www2u.biglobe.ne.jp/~y-miyata/mlvwm.html) with the following goals:

- More accurate emulation of [System 7](https://en.wikipedia.org/wiki/System_7) and [MacOS 8](https://en.wikipedia.org/wiki/Mac_OS_8) User Interfaces
- A complete configuration out-of-the-box
- Well structured configuration files

MLVWM includes a very rudimentary set of rc ([run command](https://en.wikipedia.org/wiki/Run_commands)) files and requires a fair amount of customization to better emulate Macintosh operating systems' UI. Additionally, since it is generally no more than a hobbyist window manager, no appropriate structure for the rc files (esp. for individual applications), icons (i.e. pixmaps), etc. Last, but not least, I wanted to reduce the amount of configuration needed every time I configure MLVWM on a new workstation.

## PREREQUISITES

* `mlvwm`
* `xpm`
* `locale`
* `make`

## USAGE

Run `make && make install` to install `.mlvwmrc` and `.mlvwm/` in your home directory, including downloading appropriate icons.

## TESTING

It's a good idea to test your `mlvwm` configuration prior to attempting to use it as your default window manager for the first time or after making any changes. The easiest way to do this is using `Xephyr`. I do the following:

    Xephyr :32 -screen 1024x768 &
    DISPLAY=:32 mlvwm -debug

The above will run `mlvwm` in a window, so you can test within your existing environment and easily troubleshoot or kill it if something goes wrong.

## APPLICATIONS

Configurations for the following X11 applications are included:

* [Basilisk II](http://basilisk.cebix.net/)
* [Chromium](https://www.chromium.org/)
* [Firefox](https://www.getfirefox.com/)
* [HandBrake](https://handbrake.fr/)
* [Krita](https://krita.org/)
* [Meld](http://meldmerge.org/)
* [PCManFM](https://en.wikipedia.org/wiki/PCMan_File_Manager)
* [VLC](https://www.videolan.org/vlc/)
* Xcalc
* Xclock
* [Xephyr](https://www.freedesktop.org/wiki/Software/Xephyr/)
* Xload
* Xmag
* Xmessage
* [Xosview2](http://xosview.sourceforge.net/)
* [Xterm]

## MENU EXTRAS

Configurations for the following X11 applications are included for use in the menu bar:

* [mlclock](https://github.com/morgant/mlclock)
* Xclock
* Xload

## DATA STRUCTURE

MLVWM loads its configuration from `~/.mlvwmrc`, but to break configuration up into more logical and manageable chunks within a `~/.mlvwm/` directory. That directory contains its own `.mlvwmrc` file which `~/.mlvwmrc` gets symlinked to, and it takes advantage of the `Read` command (see [mlvwm/CONFIGURATION](https://github.com/morgant/mlvwm/blob/master/CONFIGURATION)) to import the remaining configuration files.

The current structure is:

    ~/
      .mlvwmrc -> .mlvwm/.mlvwmrc
      .mlvwm/
        .mlvwmrc
        .initrc
        .restartrc
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

### .mlvwmrc

The main `rc` file. It contains some important configuration settings & commands, esp. `IconPath`, but primarily loads other `rc` & configuration files. The active theme can be changed by editing the `Read .mlvwm/theme/System7` line to one of the other theme files.

### .initrc

Contains an `InitFunction` block which can be modified to run commands upon initialization of MLVWM.

### .restartrc

Contains a `RestartFunction` block which can be modified to run commands upon init or reload of MLVWM.

### VirtualDesktops

Contains configuration settings for virtual desktops, incl. the number of virtual desktops (default is 1.)

### MenuBar

Contains the default menu bar configuration. Note: the Apple menu is actually defined in the theme files as some theme-specific settings need to be applied during creation, incl. icons. For this reason, the theme files _must_ be loaded prior to the default menu bar in `.mlvwmrc`.

### .AppManifest

Includes a `Read` command for each application-specific file in the `apps` directory. This is primarily to limit the complexity of the main `.mlvwmrc` file.

## SPECIAL THANKS

Many thanks to Takashi Hasegawa for creating [MLVWM](http://www2u.biglobe.ne.jp/~y-miyata/mlvwm.html) and Steffen Beyer for providing [Apple/Mac icons in .xpm format](http://sb.fluomedia.org/macintosh/).

## LICENSE

_TBD_

[Xosview icon](https://www.iconfinder.com/icons/9548/xosview_icon) by Oxygen Team.
