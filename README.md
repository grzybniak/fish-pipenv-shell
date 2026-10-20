# fish-pipenv-shell

A modern, bulletproof [Fish shell](https://fishshell.com) wrapper for **Pipenv** that brings back a robust, isolated `pipenv shell` behavior. 

## Why this exists?

Recent architectural updates to Pipenv dropped the legacy interactive shell completion in favor of `argcomplete`. This change caused the native `pipenv shell` command to break, freeze, or fail to adjust environment paths correctly inside the Fish shell. 

Additionally, managing multi-project environments often leads to loaded `.env` variables leaking into your main terminal session even after exiting the virtual environment.

This lightweight plugin fixes these issues natively for Fish users.

## Features

- **True Subshell Isolation:** Invoking `pipenv shell` boots a genuine standalone Fish subshell. You can safely exit using `Ctrl+D` or `exit` without closing your actual terminal window.
- **Leak-Proof `.env` Auto-loading:** Automatically reads your project's `.env` file on startup. Because the variables are bound strictly to the isolated subshell, they are instantly destroyed upon exit, leaving your host terminal completely clean.
- **Shortcuts Included:** Adds a lightning-fast `PS` alias to spin up the environment with two keystrokes.

## Installation

You can easily install this plugin using [fisher](https://github.com):

```fish
fisher install grzybniak/fish-pipenv-shell
```

## Usage

Navigate to your Python project containing a `Pipfile` and run:

```fish
pipenv shell
```

Or use the provided shorthand alias:

```fish
PS
```

### Exiting the environment

Simply hit `Ctrl+D` or type:

```fish
exit
```

Your virtual environment will deactivate, and all project-specific environment variables will instantly disappear from your terminal memory.

## Author

- **grzybniak** - [GitHub Profile](https://github.com/grzybniak)

## License

MIT License. Feel free to use, modify, and distribute.
