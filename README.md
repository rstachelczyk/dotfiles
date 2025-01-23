# Dotfiles & Config
A place for all my dotfiles and additional config / notes

vim, zsh, tmux, iTerm, VS Code, etc

<br>

# Setup


1. Clone this repo into $HOME directory using recurse-submodules option: `git clone <url> --recurse-submodules`
2. Run `./scripts/setup.sh`
3. Profit

**Note:** The setup script will download homebrew packages specified in the Brewfile, install oh-my-zsh & powerlevel10k,
and finally create the necessary symlinks into the $HOME directory


For more info on stow checkout [here](https://systemcrafters.net/managing-your-dotfiles/using-gnu-stow/)

## iTerm Setup

1. Open iTerm2 and go to settings
2. Go to the profiles tab
3. Click the `Other Actions..` button
4. Select `Import JSON Profiles...` button
5. Select `iTerm2/Default iTerm2 Profile.json` profile from within this repo
6. Select the profile that was just imported
7. Navigate to the `Colors` tab on the right hand side of the window
8. Select `Breeze` (or whichever color theme) from `iTerm2/color-themes`
9. Select the profile and click `Other Actions...` + `Set as Default`
10. Restart application and Profit

For more information on application-specific setup, look in the `/notes` directory.

<br>

# Updating Config Files

There is a script called `syncDotfiles.sh` that lives in the `scripts/` directory

This can be used to pull any new changes that have been pushed to the master branch

It will automatically re-create the symlinks for the config files after pulling the changes


<br>

# Removing Symlinks

Simply run `stow -D .` to remove all the currently linked files from the $HOME directory

<br>
<br>
<br>

### VS Code Keyboard Mappings

| From       | To      |
| ---        | ---     |
| Alt + Down | Alt + j |
| Alt + Up   | Alt + k |

```
{
  "window.zoomLevel": 2,
  "diffEditor.ignoreTrimWhitespace": false,
  "editor.tabSize": 2,
  "terminal.integrated.shell.osx": "/bin/bash",

  "vim.leader": "<Space>",
  "vim.useSystemClipboard": true,
  "editor.autoClosingQuotes": "never",
  "editor.autoClosingBrackets": "never",
  "vim.autoindent": true,
  "vim.insertModeKeyBindings": [
    {
        "before": ["j", "j"],
        "after": ["<Esc>"]
    }
  ],
  "vim.normalModeKeyBindingsNonRecursive": [
    {
      "before": ["<leader>", "o"],
      "after": [
        "o", "<Esc>"
      ]
    },
    {
      "before": ["<leader>", "O"],
      "after": [
        "O", "<Esc>"
      ]
    },
    {
      "before": ["x"],
      "after": [
        "\"", "_", "x"
      ]
    },
    {
      "before": ["<leader>", "x"],
      "after": [
        "x"
      ]
    },
    {
      "before": ["c"],
      "after": [
        "\"", "_", "c"
      ]
    },
    {
      "before": ["<leader>", "c"],
      "after": [
        "c"
      ]
    },
    {
      "before": ["C"],
      "after": [
        "\"", "_", "C"
      ]
    },
    {
      "before": ["<leader>", "C"],
      "after": [
        "C"
      ]
    },
    {
      "before": ["d"],
      "after": [
        "\"", "_", "d"
      ]
    },
    {
      "before": ["<leader>", "d"],
      "after": [
        "d"
      ]
    },
    {
      "before": ["D"],
      "after": [
        "\"", "_", "D"
      ]
    },
    {
      "before": ["<leader>", "D"],
      "after": [
        "D"
      ]
    },
    {
      "before": ["<leader>", "/"],
      "commands": [
        "editor.action.addCommentLine"
      ]
    },
    {
      "before": ["<leader>", "?"],
      "commands": [
        "editor.action.removeCommentLine"
      ]
    },
  ],
  "vim.visualModeKeyBindingsNonRecursive": [
    {
      "before": ["c"],
      "after": [
        "\"", "_", "c"
      ]
    },
    {
      "before": ["<leader>", "c"],
      "after": [
        "c"
      ]
    },
    {
      "before": ["d"],
      "after": [
        "\"", "_", "d"
      ]
    },
    {
      "before": ["<leader>", "d"],
      "after": [
        "d"
      ]
    },
    {
      "before": ["p"],
      "after": [
        "\"", "_", "d", "p"
      ]
    },
    {
      "before": ["P"],
      "after": [
        "\"", "_", "d", "P"
      ]
    },
    {
      "before": ["<leader>", "/"],
      "commands": [
        "editor.action.addCommentLine"
      ]
    },
    {
      "before": ["<leader>", "?"],
      "commands": [
        "editor.action.removeCommentLine"
      ]
    },
    {
      "before": ["="],
      "commands": [
        "editor.action.formatSelection"
      ]
    }
  ]
}
```


