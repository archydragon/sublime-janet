# Janet language support for Sublime Text

This package provides [Janet](https://janet-lang.org/) languge support and includes so far:

- syntax highlighting
- go to symbol navigation
- running Janet code right from the editor
- SublimeREPL integration

Tested against Janet v1.26.

## Screenshots

![dark](img/dark.png)

![light with rainbow brackets](img/light.png)

## Installation

### Using [Package Control](https://packagecontrol.io/)

1. [Install Package Control.](https://packagecontrol.io/installation)
2. `ctrl + shift + p` (Win/Linux) / `cmd + shift + p` (Mac) → `Package Control: Install Package` → `Janet`

### Manual

1. Go to Sublime Text user packages directory:
  * Windows: `%AppData%\Roaming\Sublime Text\Packages\User`
  * macOS: `~/Library/Application Support/Sublime Text/Packages/User`
  * Linux: `~/.config/sublime-text/Packages/User`
2. Clone this repository: `git clone https://github.com/archydragon/sublime-janet`

## Feature details

### Syntax highlighting

There is a known bug that it isn't very consistent when it comes to highlighting top level `def` calls. Other than that, should be fine.

### Build system

For this and REPL, you need to have Janet binary under one of directories listed in `PATH` environment variable.

Strictly talking, it isn't a build system, just an evaluation of current file using available Janet interpreter. Partial evaluation of expressions isn't supported yet.

### Integration with [SublimeREPL](https://packagecontrol.io/packages/SublimeREPL)

SublimeREPL upstream seems to be not really maintained for some years, but still works. Out of the box, if you have it installed, after adding Janet package to Sublime Text, its REPL should be available under `Tools` → `SublimeREPL` → `Janet`. However, if you want it to be available through the command palette, you should do the following:

1. Go to SublimeREPL installation directory (under user packages).
2. Create a directory there `config/Janet`.
3. Copy file `SublimeREPL/Main.sublime-menu` from this repo to `config/Janet`.
4. Create a file `config/Janet/Default.sublime-commands` with the following content:

```json
[
    {
        "caption": "SublimeREPL: Janet",
        "command": "run_existing_window_command", "args":
        {
            "id": "repl_janet",
            "file": "config/Janet/Main.sublime-menu"
        }
    }
]
```

`Ctrl+,` shortcuts still don't work, and I ain't sure if I did something wrong or just the age of SublimeREPL projects reveals itself.

## License

[MIT](/LICENSE)
