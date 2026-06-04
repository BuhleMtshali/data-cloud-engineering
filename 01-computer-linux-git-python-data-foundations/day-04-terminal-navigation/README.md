# 🏭 Day 4 – Linux Navigation, Filesystem Basics & Building a Fake Data Platform

## What I Did Today 🚀

Today was all about learning how to move around Linux properly **and** using those skills to build something that actually connects to my Security Data Engineering journey 😭🔥

The task for today was:

> **Create a fake data-platform directory tree with `raw`, `staged`, `curated`, `logs`, `scripts`, `configs`, and `docs` folders; document 25 commands used.**

At first glance, this looked like a simple folder-creation exercise.

But once I actually understood what I was building, it clicked:

I was not just making random directories.

I was creating a mini version of how real data teams organize a data platform.

Basically, I built this:

```text
data-platform/
├── raw/
├── staged/
├── curated/
├── logs/
├── scripts/
├── configs/
└── docs/
```

And each folder had a purpose.

Not vibes.

Not decoration.

Actual engineering logic 🧠⚙️

This project helped me understand how data moves through a system:

```text
Raw data comes in
      ↓
Gets cleaned or prepared
      ↓
Becomes trusted data
      ↓
Scripts process it
      ↓
Configs control it
      ↓
Logs track it
      ↓
Docs explain it
```

So today felt like I was moving from:

> "I know some Linux commands"

to:

> "I can organize a project like a baby data engineer." 😭📊

---

# 🧠 Key Concepts I Learned

## 🐚 What Is the Shell?

One of the first things I learned today was that the **command line refers to the shell**.

The shell is where I type commands and ask Linux to do things.

When I type something like:

```bash
ls
```

I am not just typing random letters into a black screen like a hacker in a movie 💀

I am giving an instruction to the shell.

The shell interprets my command and passes it to the operating system.

So the shell is basically the translator between me and Linux.

It lets me say:

> "Show me files."

And Linux responds with:

> "Here you go." 📂

---

## 🖥️ Terminal Emulator vs Shell

This part was important because I used to think the terminal and shell were the same thing.

They are not.

A **terminal emulator** is the program that gives me access to the shell when I am using Linux with a graphical desktop.

So if I am clicking around in a GUI with windows, icons, and a mouse, I am not directly talking to the shell yet.

I need a terminal emulator.

Think of it like this:

- 🧠 **Shell** = the brain I want to talk to
- 🖥️ **Terminal Emulator** = the phone I use to call the brain
- 🐧 **Linux** = the system that actually does the work

The terminal emulator does not interpret commands.

It does not execute programs.

It just:

- displays text
- sends my keystrokes to the shell
- shows me the output

So when I type:

```bash
ls
```

The real flow is:

```text
Me
 ↓
Terminal Emulator
 ↓
Shell
 ↓
Operating System
 ↓
Output
 ↓
Terminal Emulator
 ↓
Me
```

The terminal is just the messenger 📨

The shell is the one doing the thinking.

---

## 🐧 Common Terminal Emulators

I also learned that different Linux desktop environments can come with different terminal emulators.

Examples:

| Desktop / Tool | Terminal Emulator |
|---|---|
| KDE | `konsole` |
| GNOME | `gnome-terminal` |
| Other options | `xterm`, `alacritty`, `kitty`, `terminator` |

They may look different, but their main job is the same:

> Give me access to the shell.

So whether I use `gnome-terminal`, `konsole`, or another one, the goal is still to talk to Linux through commands.

---

# 🗂️ Linux Drive / Folder System

Today I also learned that Linux and Windows organize storage differently.

Windows uses drive letters:

```text
C:\
D:\
E:\
```

Each drive is kind of its own kingdom.

Linux said:

> "No thanks, we are doing one giant tree." 🌳

Linux uses one root:

```text
/
```

Everything lives under `/`.

That includes:

- system files
- user files
- mounted drives
- USBs
- external disks
- application files

Extra drives do not get letters.

They get mounted somewhere inside the filesystem tree.

Example:

```text
/media/usb
/mnt/storage
/home/buhle/Documents
```

This makes Linux feel much more structured once the idea clicks.

---

## ⚡ Why Linux Does Not Use Drive Letters

### 1. Consistency

In Windows, drive letters can change.

A USB might be:

```text
E:\
```

today and:

```text
F:\
```

tomorrow.

Linux avoids that chaos by mounting devices into the same directory tree.

So paths can stay cleaner and more predictable.

---

### 2. Simpler Paths

Instead of having to remember something like:

```text
D:\Projects\Data
```

Linux can mount storage at something meaningful like:

```text
/data
```

or:

```text
/mnt/data
```

That just feels cleaner.

Very Linux. Very organized. Very "I brought a clipboard." 😭

---

### 3. Scalability

Linux was built with large systems in mind.

Imagine a server with 100 drives.

Windows drive letters would run out quickly.

Linux can keep mounting storage into directories without needing alphabet gymnastics.

This is one reason Linux makes sense for servers, cloud systems, and data platforms.

---

### 4. Flexibility

Linux lets me decide where a drive appears.

For example:

```text
/media/backups
/logs
/data/raw
```

This matters in data engineering because storage paths need to be organized and predictable.

---

# ⏮️ Command History & Cursor Movement

Another thing I practiced today was using command history.

Linux remembers previous commands.

That means I can use:

- ⬆️ Up Arrow = go back to older commands
- ⬇️ Down Arrow = move forward again

This is honestly such a quality-of-life feature.

Instead of retyping a long command, I can just press the up arrow and bring it back.

Example commands in history:

```bash
ls
cd /var/log
cat syslog
```

Pressing up cycles through them.

Linux really keeps a tiny diary of my terminal decisions 📜😭

---

## ✏️ Cursor Movement

I also learned that I can move around within a command using the left and right arrow keys.

This helps when I make a typo.

Example:

```bash
cat /var/log/sysolg
```

The word `syslog` is spelled wrong.

Instead of deleting the whole command and typing it again, I can move the cursor back and fix only the typo.

This sounds small, but it makes terminal work feel way less painful.

Edit, do not suffer 😤

---

# 🧪 Simple Commands I Practiced

Before building the data platform, I practiced basic Linux commands.

These commands helped me understand where I was, what files existed, and how to inspect them.

---

## 📍 `pwd` – Where Am I?

```bash
pwd
```

`pwd` prints the current working directory.

Mental model:

> "What room am I standing in right now?" 🏠

This matters because running commands in the wrong folder can create files in the wrong place.

And Linux will not gently hold your hand and say "bestie are you sure?" 😭

---

## 📂 `ls` – What Is Here?

```bash
ls
```

`ls` lists files and directories.

Useful versions:

```bash
ls -l
ls -a
ls -la
```

- `ls -l` gives detailed information
- `ls -a` shows hidden files
- `ls -la` gives detailed info including hidden files

This helped me inspect my project structure as I built it.

---

## 🚶 `cd` – Move Around

```bash
cd Documents
cd ..
cd /
```

`cd` changes directories.

I used this to move into my project folder and navigate the filesystem.

Examples:

```bash
cd data-platform
cd ..
cd /
```

This is basically terminal teleportation.

---

## 🗂️ `file` – What Kind of File Is This?

```bash
file filename
```

The `file` command tells me what a file actually is.

This is important because Linux does not fully trust file extensions.

A file can be called:

```text
script.sh
```

but Linux still checks what it really is.

Linux said:

> "I do not believe labels. Show me the evidence." 😤

---

## 📄 `cat` – Read a File

```bash
cat file.txt
```

`cat` prints file content to the terminal.

It is useful for small files.

I used it to check files like:

```bash
cat logs/pipeline.log
cat raw/firewall_logs.csv
```

---

## 🔤 `echo` – Print or Write Text

```bash
echo "Hello Linux"
```

`echo` prints text.

It can also write text into files using redirection.

Example:

```bash
echo "Pipeline started successfully" > logs/pipeline.log
```

This was one of the most useful commands for my mini project because I used it to add fake data and documentation.

---

## 📅 `date` – Show the Date and Time

```bash
date
```

This asks the system for the current date and time.

Simple command, but useful when working with logs because logs are heavily timestamp-based.

---

## 🔍 `whoami` – Which User Am I?

```bash
whoami
```

This shows the current logged-in user.

This matters for permissions and security because different users have different access levels.

---

# 🍄 Mini Project – Fake Data Platform Directory Tree

## 📌 Today's Task

The task was:

> Create a fake data-platform directory tree with `raw`, `staged`, `curated`, `logs`, `scripts`, `configs`, and `docs` folders; document 25 commands used.

So I created a project that looks like something a real data engineering team might use.

The point was to practice Linux file and directory commands while also learning how data platforms are organized.

---

# 🏗️ Final Project Structure

```text
data-platform/
├── raw/
│   ├── auth_logs.json
│   └── firewall_logs.csv
├── staged/
│   └── cleaned_auth_logs.csv
├── curated/
│   └── security_summary.csv
├── logs/
│   └── pipeline.log
├── scripts/
│   ├── ingest.py
│   └── transform.py
├── configs/
│   └── pipeline_config.yaml
└── docs/
    ├── README.md
    └── data_dictionary.md
```

This structure represents a basic data pipeline.

Each folder has a role.

---

# 📁 Folder-by-Folder Breakdown

## 📥 `raw/`

The `raw` folder stores untouched source data.

This is where data first lands.

Examples I created:

```text
raw/auth_logs.json
raw/firewall_logs.csv
```

This layer should stay as original as possible.

In real security data engineering, this could contain:

- Linux authentication logs
- firewall logs
- AWS CloudTrail events
- endpoint telemetry
- SIEM exports

The raw layer is important because if something goes wrong later, I can always go back to the original data.

Raw data is the evidence locker 🔐📦

---

## 🧹 `staged/`

The `staged` folder stores data that has started being cleaned or prepared.

Example:

```text
staged/cleaned_auth_logs.csv
```

This is where data might be:

- cleaned
- filtered
- normalized
- formatted
- checked for missing values

It is not the final version yet.

It is the "we are fixing her up" layer 😭

---

## 💎 `curated/`

The `curated` folder stores trusted, final, ready-to-use data.

Example:

```text
curated/security_summary.csv
```

This is the data that would be used for:

- dashboards
- reports
- detections
- analytics
- threat hunting
- machine learning

Curated data is polished.

It has been cleaned and shaped into something useful.

This is the "ready for the boardroom" version of the data 💅🏽📊

---

## 📜 `logs/`

The `logs` folder stores messages about what happened when scripts or pipelines ran.

Example:

```text
logs/pipeline.log
```

I added messages like:

```text
Pipeline started successfully
Raw logs loaded
Pipeline finished successfully
```

Logs are important because they help answer:

- Did the script run?
- Did it fail?
- Where did it fail?
- What happened during execution?

In security, logs are everything.

No logs = no visibility.

No visibility = attackers get to dance in the dark 💀

---

## ⚙️ `scripts/`

The `scripts` folder stores code.

Examples:

```text
scripts/ingest.py
scripts/transform.py
```

This is where automation lives.

In a real data platform, scripts might:

- ingest files
- parse logs
- transform data
- validate records
- move data between layers

This folder is basically the engine room.

---

## 🔧 `configs/`

The `configs` folder stores configuration files.

Example:

```text
configs/pipeline_config.yaml
```

I added config values like:

```yaml
source: raw
destination: curated
log_level: INFO
```

Configs are important because they keep settings separate from code.

Instead of hardcoding everything inside a script, I can store settings in a config file.

That makes systems easier to update and maintain.

Cleaner code.

Less chaos.

More engineer energy ⚙️✨

---

## 📚 `docs/`

The `docs` folder stores documentation.

Examples:

```text
docs/README.md
docs/data_dictionary.md
```

This folder explains what the project is and how the data is structured.

Documentation matters because future-me will absolutely forget why I did things a certain way 😭

Docs are not extra.

Docs are part of the artifact.

---

# 🧱 Step-by-Step: What I Built

## Step 1 – Created the main project folder

```bash
mkdir data-platform
```

This created the main folder for the project.

Then I moved into it:

```bash
cd data-platform
```

This made `data-platform` my current working directory.

---

## Step 2 – Created the main folders

```bash
mkdir raw staged curated logs scripts configs docs
```

This created all the required folders for the data platform.

Then I checked the structure:

```bash
ls
```

Expected output:

```text
configs  curated  docs  logs  raw  scripts  staged
```

At this point, the skeleton existed.

The data platform had bones 🦴📁

---

## Step 3 – Created sample files

```bash
touch raw/auth_logs.json raw/firewall_logs.csv
touch staged/cleaned_auth_logs.csv
touch curated/security_summary.csv
touch logs/pipeline.log
touch scripts/ingest.py scripts/transform.py
touch configs/pipeline_config.yaml
touch docs/README.md docs/data_dictionary.md
```

This created empty files inside each folder.

Now the project was not just empty folders.

It had actual placeholder artifacts.

---

## Step 4 – Added fake raw authentication data

```bash
echo '{"user":"buhle","event":"login","status":"success"}' > raw/auth_logs.json
```

This created a fake authentication log in JSON format.

It represents a login event.

Example meaning:

- user = `buhle`
- event = `login`
- status = `success`

This is the kind of data that security teams might analyze to understand user activity.

---

## Step 5 – Added fake firewall log data

```bash
echo "timestamp,src_ip,dst_ip,action" > raw/firewall_logs.csv
echo "2026-06-04,10.0.0.5,8.8.8.8,ALLOW" >> raw/firewall_logs.csv
```

This created a CSV-style firewall log.

The first command created the header row.

The second command added a fake firewall event.

Fields:

| Field | Meaning |
|---|---|
| `timestamp` | When the network event happened |
| `src_ip` | Source IP address |
| `dst_ip` | Destination IP address |
| `action` | Whether traffic was allowed or blocked |

This helped me connect Linux commands to security log data.

---

## Step 6 – Added pipeline configuration

```bash
echo "source: raw" > configs/pipeline_config.yaml
echo "destination: curated" >> configs/pipeline_config.yaml
echo "log_level: INFO" >> configs/pipeline_config.yaml
```

This created a YAML config file.

The config tells the fake pipeline:

```yaml
source: raw
destination: curated
log_level: INFO
```

Meaning:

- read data from `raw`
- send final output to `curated`
- log informational messages

This is a small example of how real pipelines use configs.

---

## Step 7 – Created a tiny Python ingest script

```bash
echo 'print("Ingesting raw security logs...")' > scripts/ingest.py
```

This created a simple Python script.

Then I ran it:

```bash
python3 scripts/ingest.py
```

Expected output:

```text
Ingesting raw security logs...
```

Even though the script was simple, it helped me understand where code belongs inside a data project.

Scripts belong in `scripts/`.

Not randomly chilling in the root folder like lost luggage 😭

---

## Step 8 – Created pipeline logs

```bash
echo "Pipeline started successfully" > logs/pipeline.log
echo "Raw logs loaded" >> logs/pipeline.log
echo "Pipeline finished successfully" >> logs/pipeline.log
```

This created a fake pipeline log file.

Then I viewed it:

```bash
cat logs/pipeline.log
```

Expected output:

```text
Pipeline started successfully
Raw logs loaded
Pipeline finished successfully
```

This showed how logs can track what a pipeline did.

---

## Step 9 – Added project documentation

```bash
echo "# Data Platform Project" > docs/README.md
echo "This project simulates a basic data engineering platform." >> docs/README.md
```

This created basic documentation.

Then I created a data dictionary:

```bash
echo "field,description" > docs/data_dictionary.md
echo "src_ip,Source IP address" >> docs/data_dictionary.md
echo "dst_ip,Destination IP address" >> docs/data_dictionary.md
```

The data dictionary explains fields in the dataset.

This matters because data without context is just digital soup 🍲

---

## Step 10 – Checked the final structure

If `tree` is installed:

```bash
tree
```

If not:

```bash
find . -type f
```

This helped me verify that the project files were created correctly.

---

# 📜 Mini Project Command Flow

These are the main commands I used to build the project:

```bash
mkdir data-platform
cd data-platform

mkdir raw staged curated logs scripts configs docs

touch raw/auth_logs.json raw/firewall_logs.csv
touch staged/cleaned_auth_logs.csv
touch curated/security_summary.csv
touch logs/pipeline.log
touch scripts/ingest.py scripts/transform.py
touch configs/pipeline_config.yaml
touch docs/README.md docs/data_dictionary.md

echo '{"user":"buhle","event":"login","status":"success"}' > raw/auth_logs.json

echo "timestamp,src_ip,dst_ip,action" > raw/firewall_logs.csv
echo "2026-06-04,10.0.0.5,8.8.8.8,ALLOW" >> raw/firewall_logs.csv

echo "source: raw" > configs/pipeline_config.yaml
echo "destination: curated" >> configs/pipeline_config.yaml
echo "log_level: INFO" >> configs/pipeline_config.yaml

echo 'print("Ingesting raw security logs...")' > scripts/ingest.py
python3 scripts/ingest.py

echo "Pipeline started successfully" > logs/pipeline.log
echo "Raw logs loaded" >> logs/pipeline.log
echo "Pipeline finished successfully" >> logs/pipeline.log

echo "# Data Platform Project" > docs/README.md
echo "This project simulates a basic data engineering platform." >> docs/README.md

echo "field,description" > docs/data_dictionary.md
echo "src_ip,Source IP address" >> docs/data_dictionary.md
echo "dst_ip,Destination IP address" >> docs/data_dictionary.md

find . -type f
```

---

# 🔍 25 Commands I Documented Today

| # | Command | What It Does | Example |
|---:|---|---|---|
| 1 | `pwd` | Shows the current working directory | `pwd` |
| 2 | `mkdir` | Creates a new directory | `mkdir data-platform` |
| 3 | `cd` | Changes the current directory | `cd data-platform` |
| 4 | `ls` | Lists files and directories | `ls` |
| 5 | `ls -l` | Lists files with detailed information | `ls -l` |
| 6 | `ls -la` | Lists all files, including hidden ones, with details | `ls -la` |
| 7 | `touch` | Creates an empty file or updates timestamps | `touch raw/auth_logs.json` |
| 8 | `echo` | Prints text or writes text into files | `echo "Hello Linux"` |
| 9 | `>` | Redirects output and overwrites a file | `echo "test" > file.txt` |
| 10 | `>>` | Redirects output and appends to a file | `echo "more text" >> file.txt` |
| 11 | `cat` | Displays file contents | `cat logs/pipeline.log` |
| 12 | `file` | Shows what type of file something is | `file raw/auth_logs.json` |
| 13 | `date` | Displays system date and time | `date` |
| 14 | `whoami` | Shows the current logged-in user | `whoami` |
| 15 | `cp` | Copies files or directories | `cp raw/auth_logs.json staged/auth_logs_backup.json` |
| 16 | `mv` | Moves or renames files/directories | `mv old.txt new.txt` |
| 17 | `rm` | Deletes files | `rm temp.txt` |
| 18 | `rmdir` | Deletes empty directories | `rmdir old_folder` |
| 19 | `find` | Searches for files and directories | `find . -type f` |
| 20 | `locate` | Finds files quickly using a database | `locate auth_logs` |
| 21 | `which` | Shows the path of an executable command | `which python3` |
| 22 | `whereis` | Finds binary, source, and manual locations | `whereis python3` |
| 23 | `grep` | Searches text patterns inside files or output | `grep "Pipeline" logs/pipeline.log` |
| 24 | `head` | Shows the first lines of a file | `head raw/firewall_logs.csv` |
| 25 | `tail` | Shows the last lines of a file | `tail logs/pipeline.log` |

---

# 🧪 Extra Commands I Also Touched

| Command | Purpose |
|---|---|
| `man` | Opens manual pages for commands |
| `more` | Views a file page by page |
| `less` | Views and searches through files more flexibly |
| `nl` | Displays files with line numbers |
| `sed` | Searches and transforms text |
| `ps` | Shows running processes |
| `tree` | Displays a visual directory tree |
| `chmod` | Changes file permissions |
| `python3` | Runs Python scripts |
| `du -sh` | Shows folder size |

---

# 🌍 Real-World Application

This project connects directly to Security Data Engineering.

In real life, security teams deal with huge amounts of log data.

That data needs to be collected, cleaned, organized, processed, and analyzed.

A real security data platform might look like this:

| Folder | Real Security Use |
|---|---|
| `raw/` | Original firewall logs, CloudTrail logs, Linux auth logs |
| `staged/` | Cleaned and normalized security events |
| `curated/` | Analyst-ready datasets and detection outputs |
| `logs/` | Pipeline execution logs and error tracking |
| `scripts/` | Python ETL scripts, parsers, validation scripts |
| `configs/` | Thresholds, source paths, environment settings |
| `docs/` | Architecture notes, field definitions, runbooks |

This matters because security teams need clean and reliable data to detect threats.

If the data is messy, detections become messy.

If logs are missing, investigations become harder.

If documentation is missing, everyone suffers 😭

So this task taught me that organization is not just "being neat."

It is part of engineering.

---

# 💥 Challenges I Faced

- Understanding the difference between the shell and terminal emulator
- Getting used to Linux having one root `/` instead of Windows-style drive letters
- Remembering where I was in the filesystem
- Avoiding creating files in the wrong directory
- Understanding which folder should hold which type of data
- Remembering all the different command purposes
- Getting comfortable with output redirection using `>` and `>>`
- Understanding why `raw`, `staged`, and `curated` need to be separate layers

---

# 💡 How I Worked Through It

- I used `pwd` often to confirm where I was
- I used `ls` to check what existed in each folder
- I used `cat` to verify file contents
- I practiced using `echo`, `>`, and `>>` to write content into files
- I broke the data platform into layers instead of thinking of it as random folders
- I connected each folder to a real-world data engineering use case

Basically, I stopped thinking:

> "I am creating folders."

And started thinking:

> "I am designing a mini data system." 🏗️

---

# 🏆 What I Can Do Now

After Day 4, I can:

✅ Explain the difference between a shell and terminal emulator

✅ Navigate the Linux filesystem

✅ Understand why Linux uses one root directory `/`

✅ Use command history and cursor movement

✅ Create files and directories from the terminal

✅ Write text into files using redirection

✅ Inspect file contents

✅ Search for files and text

✅ Build a structured data platform directory tree

✅ Explain the purpose of `raw`, `staged`, `curated`, `logs`, `scripts`, `configs`, and `docs`

✅ Connect Linux basics to Security Data Engineering

So today was not just command practice.

It was data platform thinking.

---

# 📚 Resources Used

- Linux Foundations practice
- Kali Linux terminal
- Linux manual pages (`man`)
- Hands-on command-line exercises
- Data platform mini project
- Personal notes
- ChatGPT explanations and troubleshooting

---

# 🧃 Final Thoughts

Today felt like unlocking the "data platform starter pack" 🎒📊

At first, I was just learning how to move around Linux and create files.

But then the mini project made everything feel more real.

Creating `raw`, `staged`, `curated`, `logs`, `scripts`, `configs`, and `docs` helped me understand how engineers organize systems so they do not become a digital junk drawer 😭

I can now see how this connects to my future path.

Security data engineering is not just about knowing Python or security tools.

It is also about structure.

Where does the data land?

Where does it get cleaned?

Where does trusted data live?

Where do scripts go?

Where do logs go?

How will another person understand this project later?

Today made me realize that good engineers do not just build things.

They organize them so other people can trust, use, debug, and improve them.

Security Data Engineer Zanobuhle loading...

██████░░░░ 50% 🚀🔐📊
