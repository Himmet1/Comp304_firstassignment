# Shell-ish - Interactive Unix-style Shell

A custom Unix-style operating system shell written in C for COMP 304 Assignment 1.

**Student:** Himmet

**Repository:** https://github.com/himmet/Comp304_firstassignment

## Building and Running

```bash
gcc -o shell-ish shellish-skeleton.c
./shell-ish
```

## Features

### Part I - Core Shell (10 pts)
- Command execution using `execv()` with manual PATH resolution (`resolve_path()`)
- Background process support using `&` (shell returns prompt immediately)
- Builtin `cd` and `exit` commands
- SIGCHLD handler for reaping zombie background processes

### Part II - I/O Redirection & Piping (10+10 pts)

#### I/O Redirection
- Input redirection: `wc -l <input.txt`
- Output redirection (truncate): `ls -la >output.txt`
- Append redirection: `echo hello >>output.txt`
- Implemented using `dup2()` and `open()` system calls

**Note:** No spaces between redirect symbols and filenames (parser requirement).

#### Piping
- Supports multi-command pipes: `ls -la | grep shell | wc`
- Implemented recursively using `pipe()` and `dup2()`
- Handles arbitrary-length pipe chains

### Part III - Builtin Commands (25+25+20 pts)

#### (a) `cut` - Field Extraction (25 pts)
Reads from stdin and prints only specified fields, similar to UNIX `cut`.

**Options:**
- `-d` / `--delimiter` : delimiter character (default: TAB)
- `-f` / `--fields` : comma-separated field indices (1-indexed)

**Examples:**
```bash
cat /etc/passwd | cut -d ":" -f 1,6
# root:/root
# bin:/bin
# mail:/var/spool/mail
# ...
```

#### (b) `chatroom` - Group Chat via Named Pipes (25 pts)
Real-time group chat using named pipes (FIFOs).

**Usage:** `chatroom <roomname> <username>`

- Rooms are created at `/tmp/chatroom-<roomname>/`
- Each user gets a named pipe in the room directory
- Messages sent by writing to all other users' named pipes using forked children
- Messages received by continuously reading from own named pipe
- Type `/exit` to leave the chatroom

**Example (two separate terminals):**
```bash
# Terminal 1:
chatroom comp304 ali

# Terminal 2:
chatroom comp304 mehmet
```

#### (c) `countdown` - Sword Countdown Timer (20 pts, Custom Command)
A visual countdown timer styled as a sword being forged. The blade fills up as time passes.

**Usage:** `countdown <seconds>`

**Example:**
```bash
countdown 10
```

While counting:
```
  Forging your sword... 10 seconds

   7 sec  <>={================------------------------------------>  34%
```

When complete:
```
  Done!  <>={===================================================>  100%
  Your sword is ready!
```

## AI Citation

AI coding assistant (Claude by Anthropic) was used to help with implementation of this assignment. All code was reviewed, tested, and understood by the student.