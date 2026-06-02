# 🚀 Day 2 – Windows vs Linux vs macOS: Meet the Operating System Trio 🖥️⚔️🐧🍎

## 📌 Overview

- Today I went down the operating system rabbit hole and compared the three biggest players in modern computing:

    - 🪟 Windows

    - 🐧 Linux

    - 🍎 macOS

- At first glance they all seem to do the same thing:

```
Open apps
Save files
Connect to the internet
Exist peacefully

```

- But under the hood?

    - Absolute chaos. 😭

- Each operating system organizes files differently, manages processes differently, stores logs differently, installs software differently, and gives administrators different ways to manage systems.

- Since my long-term goal is ***Cloud Security Data Engineering***, understanding operating systems isn't optional.

- Every cloud server, database, container, pipeline, log source, SIEM, and security tool eventually sits on top of an operating system.

- Today was basically:

    > ***Learn the kingdom before defending the castle 🏰🔐***

## 🎯 Objectives

- By the end of today I wanted to:

    - ✅ Understand what an operating system actually does

    - ✅ Compare Windows, Linux, and macOS architectures

    - ✅ Learn how each operating system organizes files

    - ✅ Explore process management and monitoring tools

    - ✅ Understand where logs live and why they matter

    - ✅ Learn how software gets installed through package managers

    - ✅ Connect operating system concepts to cloud infrastructure and security operations


## 🧠 Key Concepts

### 🔹 What Even Is An Operating System?

- Think of an operating system as the manager of a very busy company 🏢

- The employees are:

    - CPU ⚡

    - RAM 🧠

    - Storage 💾

    - Network Interfaces 🌐

    - Applications 📱

- The operating system makes sure everyone gets work, nobody fights over resources, and the whole company doesn't burst into flames.

- Without an operating system you'd basically have to speak directly to hardware.

- And trust me...

- Nobody wants that smoke 😭

😭

## 🔹 Filesystems: The City's Street Map 🗺️

- A filesystem determines where everything lives.

### 🪟 Windows

- Windows likes drive letters

```
C:\
D:\
E:\

```

- Example:

```
C:\Users\Buhle\Documents

```

- Windows looked at storage and said:

    > "Alphabet. We ride at dawn." 🔤⚔️

### 🐧 Linux

- Linux looked at drive letters and said:

    >"Nah."

- Everything starts from:

```
/

```

- The root directory.

```
/
├── home
├── etc
├── var
├── usr
└── tmp

```

- Example:

```
/home/buhle/projects

```

- Linux filesystems feel like one giant tree 🌳


### 🍎 macOS

- macOS secretly copied Linux's homework.

- Example:

```
/Users/buhle/Documents

```

- Same Unix DNA.

- Different drip ✨🍏

## 🔹 Processes: Tiny Workers Inside The Machine 🏃

- A process is simply:

> A running program.

- Examples:

    - Chrome 🌐

    - Spotify 🎵

    - VS Code 💻

    - Python Scripts 🐍

- Every operating system has tools to monitor and manage these digital workers.


## 🪟 Windows

- Tools:

```
tasklist
taskkill

```
- GUI:

### 🖥️ Task Manager

- The place where frozen applications go to meet their ancestors ☠️

## 🐧 Linux

- Tools:

```
ps
top
htop
kill

```

- Linux admins spend so much time in htop that it practically becomes a second home 😭


## 🍎 macOS

- Uses:

```
ps
top
kill

```

- GUI:

> ***🍏 Activity Monitor***

- Apple's version of Task Manager.

## 🔹 Logs: The Digital Receipt Book 🧾🔥

- Logs answer the questions:

    - Who did what?

    - When did they do it?

    - Where did they do it from?

    - What exploded?

- Security teams live and breathe logs.

- No logs = no receipts.

- No receipts = pain. 😭

## 🪟 Windows

- Uses:

### 📜 Event Viewer

- Contains:

    - Application Logs

    - System Logs

    - Security Logs


## 🐧 Linux

- Usually stored in:

```
/var/log

```
- Examples:

```
/var/log/auth.log
/var/log/syslog

```

- The sacred scrolls of Linux 🔮🐧

### 🍎 macOS

- Uses:

### 🍏 Console

- Or:

```bash

log show

```

## 🔹 Package Managers: Installing Software Like A Wizard 🧙

- Imagine downloading software manually every time.

- Absolutely not.

- We have standards.

### 🪟 Windows

```powershell

winget install vscode

```

### 🐧 Linux

```bash

sudo apt install nginx

```

### 🍎 macOS

```bash

brew install git

```

- Homebrew might be one of the most beloved developer tools ever created 🍺