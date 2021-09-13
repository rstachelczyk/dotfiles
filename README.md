# VS-code-settings
A place for all my VS code settings and keybinds

VS Code Keyboard Mappings
| From       | To      |
| ---        | ---     |
| Alt + Down | Alt + j |
| Alt + Up   | Alt + k |

`
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
`


