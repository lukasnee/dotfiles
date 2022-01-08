
# VScode

## User/keybindings.json

> win full path: `C:\Users\<USERNAME>\AppData\Roaming\Code\User\keybindings.json`


```json
[
    { "key": "ctrl+alt+`", "command": "workbench.action.focusActiveEditorGroup" },
    { "key": "ctrl+k e", "command": "workbench.explorer.fileView.focus" },
    
    { "key": "ctrl+shift+alt+b", "command": "workbench.action.tasks.test" },
    
    { "key": "shift+space i","command": "editor.action.indentationToSpaces" },
    { "key": "shift+space s", "command": "git.stageSelectedRanges", "when": "isInDiffEditor" },
    { "key": "shift+space u", "command": "git.unstageSelectedRanges", "when": "isInDiffEditor" },
    { "key": "shift+space p", "command": "workbench.action.problems.focus" },
    { "key": "shift+space t", "command": "workbench.action.toggleMaximizedPanel"},
    
    { "key": "alt+k", "command": "workbench.action.terminal.resizePaneUp" },
    { "key": "alt+j", "command": "workbench.action.terminal.resizePaneDown" },
    { "key": "alt+h", "command": "workbench.action.terminal.resizePaneLeft" },
    { "key": "alt+l", "command": "workbench.action.terminal.resizePaneRight" },
    { "key": "shift+space b", "command": "workbench.action.tasks.runTask", "args": "Build All (Release)" },
    
    // User/tasks.json
    {
        "key": "shift+space g",
        "command": "workbench.action.tasks.runTask",
        "args": "Open Git Bash in terminal view 1"
    },
    {
        "key": "shift+space 1",
        "command": "workbench.action.tasks.runTask",
        "args": "Open Git Bash in terminal view 1"
    },
    {
        "key": "shift+space 2",
        "command": "workbench.action.tasks.runTask",
        "args": "Open Git Bash in terminal view 2"
    },
    {
        "key": "shift+space 3",
        "command": "workbench.action.tasks.runTask",
        "args": "Open Git Bash in terminal view 3"
    }
]
```

## User/tasks.json

> win full path: `C:\Users\<USERNAME>\AppData\Roaming\Code\User\tasks.json`

```json
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Open Git Bash in terminal view 1",
            "type": "shell",
            "dependsOn" : [ "Open Git Bash in terminal view" ],
            "windows": {
                "command": "powershell",
                "args": ["git-cmd.exe --command=\"usr/bin/bash.exe\" -l -i "]
            },
            "presentation": {
                "echo": false,
                "focus": true,
                "panel": "new",
                "group": "git"
            }
        },
        {
            "label": "Open Git Bash in terminal view 2",
            "type": "shell",
            "windows": {
                "command": "powershell",
                "args": ["git-cmd.exe --command=\"usr/bin/bash.exe\" -l -i "]
            },
            "presentation": {
                "echo": false,
                "focus": true,
                "panel": "new",
                "group": "git"
            }
        },
        {
            "label": "Open Git Bash in terminal view 3",
            "type": "shell",
            "windows": {
                "command": "powershell",
                "args": ["git-cmd.exe --command=\"usr/bin/bash.exe\" -l -i "]
            },
            "presentation": {
                "echo": false,
                "focus": true,
                "panel": "new",
                "group": "git"
            }
        }
    ]
}

```
# Shell Tricks
Generate a random data file of given size in bytes  
```shell
$ head -c 1024 /dev/urandom > 1KB.dat
```


# Regex Tricks

# match block between HEAD and TAIL that in between contains  a PATTERN
## match first
```regex
(?m)HEAD(?:(?!HEAD)[\s\S])+(PATTERN)[\s\S]+?(?=TAIL)
```

## match multiple (probably does not work)
```regex
(?g)(?m)HEAD(?:(?!HEAD)[\s\S])+(PATTERN)[\s\S]+?(?=TAIL)
```

# jenkins date parser
```regex
\[\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z\] 
```



# Reduce ...types.map to nested structure
```regex
r"\|([\w<>]+\.)+" replace to r""
```

\|(([\w<>]+\.)+(<anonymous>)|)


GOOOD:
(\w+)(?=\|).*0x([0-9|a-f]+).*;\s+(?:|array\[(\d+)\] of )(\w+)$