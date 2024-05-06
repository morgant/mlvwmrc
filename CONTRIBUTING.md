# Contributing to mlvwmrc

We welcome feedback, bug fixes, and feature request. Ultimately, what gets accepted and merged into the project is up to the current project maintainer ([Morgan Aldridge](https://github.com/morgant)) and what they feel is appropriate for all users of the project, but you are encouraged to submit any suggestions.

Please submit bugs and feature requests for the mlvwmrc configuration files via the project’s [issue tracker](https://github.com/morgant/mlvwm/issues). *Note:*: _If the bug or feature request is actually related to the [MLVWM](https://github.com/morgant/mlvwm) window manager, please report in [that project's issue tracker](https://github.com/morgant/mlvwm/issues)._

## What You Need

You will need the following to contribute:

* A [GitHub](http://github.com) account for submitting pull requests
* X11
* [MLVWM](https://github.com/morgant/mlvwm)

## Making Changes

Follow these steps when making changes. That way, they will most likely be accepted with few headaches and very little back and forth.

1. Fork the [mlvwmrc](https://github.com/morgant/mlvwmrc) project on GitHub.
2. Create a topic branch from the `master` branch. Name your branch appropriately, reflecting the intended changes (e.g. “new-application-styles” or “documentation-improvements”)
3. Make your edits (please try to conform to our [style guide](#style-guide)).
4. Make commits in logical units and with concise but explanatory commit messages. Please reference any appropriate issue numbers, e.g. "Issue #16".
5. Ensure your changes build without additional warnings or errors. We suggest testing in `Xephyr`.

## Submitting Changes

When you’ve completed your changes and are ready to merge them into the main project, follow these steps to submit them for review.

1. Push the changes to your fork of the [mlvwmrc](https://github.com/morgant/mlvwmrc) project on GitHub
2. Submit a pull request to the [mlvwmrc](https://github.com/morgant/mlvwmrc) project

That’s all there is to it.

If you followed the [making changes](#making-changes) guidelines and the changes are aligned with the vision of the project, it should be a smooth process to merge them.

## Style Guide

Please see the [README](README.md) for the overall structure of the configuration files. Below are guidelines for specific MLVWM configuration file commands:

### MenuBar & Menu

You'll primarily find `MenuBar` and `Menu` built-in commands used in `.mlvwm/MenuBar`, `.mlvwm/MenuExtras/*`, and `.mlvwm/apps/*`.

*Important*: When creating `MenuBar` and `Menu` labels for new applications and Menu Extras, the labels must be unique across the entirety of the MLVWM/mlvwmrc configuration files. Please search the repository for conflicting labels.

That said, MLVWM currently will only find the _last_ definition of a `MenuBar` or `Menu`, so this can be taken advantage of to override previous definitions in some cases. It's preferable to avoid such hacks as much as possible as, especially with the heavy use of `Read` commands in the mlvwmrc configurations which can make determining exactly when a configuration command is used more difficult.

#### MenuBar

`MenuBar` labels should be that of the application or MenuExtra name in CamelCase, e.g. (`Chrome` or `HandBrake`).

#### Menu

`Menu` labels should start with the same application or MenuExtra name as the `MenuBar` label followed by a dash and the name of the menu in CamelCase (e.g. `Chrome-File` or `Chrome-Bookmarks`.)

Labels for sub menus should start with the full label of the parent `Menu` followed by a dash and the name of the sub menu in CamelCase (e.g. `Default-Special-WindowManager`.)
