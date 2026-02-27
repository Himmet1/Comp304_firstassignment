# Shell-ish - Interactive Unix-style Shell

A custom Unix-style operating system shell written in C for COMP 304 Assignment 1.

**Repository:** https://github.com/himmet/Comp304_firstassignment

## Building and Running

```bash
gcc -o shell-ish shellish-skeleton.c
./shell-ish
```

## Features

### Part I - Core Shell
- Command execution using `execv()` with manual PATH resolution
- Background process support (`&`)
- Builtin `cd` and `exit` commands

### Part II - I/O Redirection & Piping
- Input redirection: `wc -l <input.txt`
- Output redirection: `ls -la >output.txt`
- Append redirection: `echo hello >>output.txt`
- Piping: `ls -la | grep shell | wc`

**Note:** No spaces between redirect symbols and filenames.

### Part III - Builtin Commands

#### (a) `cut` - Field Extraction
Reads from stdin and prints only specified fields.

**Options:**
- `-d` / `--delimiter` — delimiter character (default: TAB)
- `-f` / `--fields` — comma-separated field indices

**Examples:**
```bash
cat /etc/passwd | cut -d ":" -f 1,6
# Output: root:/root, bin:/bin, etc.

echo "a:b:c:d" | cut -d ":" -f 1,3
# Output: a:c
```

#### (b) `chatroom` - Group Chat via Named Pipes
Real-time group chat using named pipes (FIFOs).

**Usage:** `chatroom <roomname> <username>`

Rooms are created at `/tmp/chatroom-<roomname>/`. Each user gets a named pipe. Messages are sent by writing to all other users' pipes.

**Example (run in separate terminals):**
```bash
# Terminal 1
chatroom comp304 ali

# Terminal 2
chatroom comp304 mehmet
```

Type messages in the prompt and they appear in all other users' terminals.

#### (c) `countdown` - Sword Countdown Timer (Custom Command)
A visual countdown timer styled as a sword whose blade fills up as time elapses.

**Usage:** `countdown <seconds>`

**Example:**
```bash
countdown 10
```

While counting:
```
   7 sec  ◆═╬═━━━━━━━━━━━━━━╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌▶  30%
```

When time is up — the full sword:
```
  ⚔️  Done!  ◆═╬═━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━▶  100%
```

**Use cases:** Pomodoro timer, cooking timer, presentation countdown, or waiting for a build.