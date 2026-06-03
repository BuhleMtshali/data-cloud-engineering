# 🚀 Day 3 – Installing Ubuntu in VirtualBox on Apple Silicon (Mac Mini M4)

## 📌 Overview

Today's objective was to set up a virtualized Ubuntu environment using VirtualBox on a Mac Mini M4. This included installing Ubuntu ARM64, configuring a shared folder between the host and guest operating systems, creating snapshots, and testing snapshot rollback functionality.

This lab establishes the foundation for future cloud security, Linux administration, networking, and cybersecurity exercises by providing a safe, isolated environment for experimentation and learning.

---

## 🎯 Objectives

* Install VirtualBox on macOS (Apple Silicon)
* Download and install Ubuntu ARM64
* Create and configure a virtual machine
* Update the Ubuntu operating system
* Configure a shared folder between macOS and Ubuntu
* Create a VM snapshot
* Test snapshot rollback functionality
* Document the installation process

---

# 🧠 Key Concepts

## 🔹 Virtualization

Virtualization allows multiple operating systems to run on a single physical machine through the use of virtual machines (VMs). Each VM operates independently with its own virtual CPU, memory, storage, and networking.

### Why It Matters

Virtualization is heavily used in:

* Cloud computing
* Security testing labs
* Software development
* Malware analysis
* Incident response environments

---

## 🔹 Ubuntu

Ubuntu is a popular Linux distribution widely used across:

* Cloud environments
* Servers
* Containers
* Security tools
* Development environments

Learning Ubuntu provides a strong foundation for cloud and cybersecurity careers.

---

## 🔹 Snapshots

A snapshot captures the exact state of a virtual machine at a specific point in time.

Think of a snapshot as a save point in a video game.

Snapshots allow users to:

* Recover from mistakes
* Test software safely
* Revert unwanted changes
* Create clean lab environments

---

## 🔹 Shared Folders

Shared folders provide a secure method for exchanging files between the host operating system (macOS) and the guest operating system (Ubuntu).

Benefits include:

* Easy file transfer
* Access to notes and scripts
* Sharing project files
* Moving screenshots between systems

---

# 🛠 Tools & Software Used

| Tool                   | Purpose                     |
| ---------------------- | --------------------------- |
| VirtualBox             | Virtualization platform     |
| Ubuntu 24.04 LTS ARM64 | Linux operating system      |
| Terminal               | Command-line administration |
| apt                    | Ubuntu package manager      |
| Snapshot Manager       | VM state management         |
| Shared Folders         | Host-to-guest file sharing  |

---

# 💻 Mini Project: Ubuntu Virtual Machine Setup

## 📖 Description

A complete Ubuntu virtual machine was deployed on a Mac Mini M4 using VirtualBox.

The environment was configured with:

* Ubuntu ARM64
* Shared folder integration
* System updates
* Snapshot functionality
* Rollback testing

This VM will serve as the primary lab environment throughout the Cloud Security Engineering roadmap.

---

## ⚙️ Installation Steps

### Step 1: Install VirtualBox

Downloaded and installed VirtualBox for Apple Silicon macOS hosts.

Verified successful installation by launching VirtualBox and granting necessary permissions.

---

### Step 2: Download Ubuntu ARM64

Downloaded:

```text
Ubuntu 24.04 LTS ARM64
```

Selected ARM architecture because the Apple M4 processor uses ARM instead of x86 architecture.

---

### Step 3: Create Virtual Machine

Created a new virtual machine with:

| Setting   | Value           |
| --------- | --------------- |
| Name      | Ubuntu-24.04    |
| Type      | Linux           |
| Version   | Ubuntu (64-bit) |
| Memory    | 4096 MB         |
| CPUs      | 4               |
| Disk Size | 40 GB           |

---

### Step 4: Install Ubuntu

Completed Ubuntu installation using:

* English language
* Normal installation
* Default partitioning
* Custom user account

Successfully booted into the Ubuntu desktop environment.

---

### Step 5: Update Ubuntu

Executed:

```bash
sudo apt update
sudo apt upgrade -y
```

Updated package repositories and installed the latest software updates.

---

### Step 6: Configure Shared Folder

Created a shared folder on macOS:

```text
~/CloudSecurityShared
```

Configured VirtualBox Shared Folder settings:

* Auto Mount Enabled
* Permanent Mount Enabled

Verified accessibility from Ubuntu.

---

### Step 7: Create Snapshot

Created a snapshot named:

```text
Fresh Ubuntu Install
```

Description:

```text
Ubuntu installed
Updates completed
Shared folder configured
```

The snapshot serves as a clean recovery point for future labs.

---

### Step 8: Test Snapshot Rollback

Created a test file:

```bash
touch rollback-test.txt
```

Confirmed file creation:

```bash
ls
```

Shutdown VM.

Restored snapshot:

```text
Fresh Ubuntu Install
```

Restarted VM and verified that the test file no longer existed.

This confirmed successful rollback functionality.

---

# 🧪 Commands Used

| Command             | Purpose                                | Example                 |
| ------------------- | -------------------------------------- | ----------------------- |
| sudo apt update     | Refresh package repository information | sudo apt update         |
| sudo apt upgrade -y | Upgrade installed packages             | sudo apt upgrade -y     |
| touch               | Create a file                          | touch rollback-test.txt |
| ls                  | List files and directories             | ls                      |
| cat                 | View file contents                     | cat hello.txt           |
| cd                  | Change directories                     | cd /mnt                 |

---

# 📊 Results

### Successfully Completed

✅ Installed VirtualBox on macOS

✅ Downloaded Ubuntu ARM64

✅ Created Ubuntu virtual machine

✅ Installed Ubuntu 24.04 LTS

✅ Updated operating system packages

✅ Configured shared folder

✅ Created VM snapshot

✅ Tested snapshot rollback

✅ Verified successful recovery process

---

# 🧩 Challenges Faced

### Challenge 1: Apple Silicon Compatibility

Apple M4 processors use ARM architecture instead of traditional x86 architecture.

### Solution

Downloaded the ARM64 version of Ubuntu rather than the standard x86 release.

---

### Challenge 2: Understanding Snapshot Functionality

Initially unclear how snapshots differed from backups.

### Solution

Learned that snapshots capture the exact state of a VM at a point in time, allowing instant restoration without reinstalling the operating system.

---

# 💡 Lessons Learned

* Virtualization creates isolated environments for safe experimentation.
* Ubuntu ARM64 is required on Apple Silicon systems.
* Shared folders simplify file transfers between host and guest operating systems.
* Snapshots provide rapid recovery from configuration errors.
* Virtual machines are critical tools for cloud security labs and cybersecurity training.

---

# 🔗 Key Takeaways

* VirtualBox enables efficient virtualization on macOS.
* Ubuntu is one of the most widely used operating systems in cloud environments.
* Snapshots function as restore points for virtual machines.
* Shared folders improve workflow between host and guest systems.
* Building a reliable lab environment is the first step toward cloud security engineering.

---

# 🌍 Real-World Application

Virtual machines are heavily used in:

* Cloud engineering
* Security operations centers (SOCs)
* Malware analysis
* Penetration testing labs
* Infrastructure testing
* Incident response environments
* Software development

Snapshots are particularly valuable when testing potentially risky configurations because systems can be restored instantly if problems occur.

---

# 🧠 Reflection

Today was my first step toward building a dedicated cloud security lab environment.

Installing Ubuntu inside VirtualBox helped me understand how virtualization works and why it is so widely used in cloud and cybersecurity environments. Configuring shared folders showed how host and guest operating systems can work together, while snapshots demonstrated an efficient way to recover from mistakes without rebuilding an entire system.

The snapshot rollback test was especially valuable because it highlighted how virtualization supports safe experimentation. Knowing that I can easily revert changes gives me confidence to explore more advanced cloud security and Linux administration topics in future labs.

---

# 🚀 Next Steps

* Learn Linux filesystem navigation
* Explore basic Linux commands
* Understand users, groups, and permissions
* Practice terminal-based administration
* Begin Linux security fundamentals

---

# 📚 Resources Used

* VirtualBox Documentation
* Ubuntu Official Documentation
* Ubuntu 24.04 LTS ARM64 Installation Guide
* Cloud Security Engineering Roadmap
* macOS System Settings Documentation

---

---

## 🏁 Conclusion

A fully functional Ubuntu virtual machine was successfully deployed and configured on a Mac Mini M4 using VirtualBox. Shared folder integration, snapshot management, and rollback testing were completed successfully, providing a stable and recoverable lab environment for future cloud security engineering exercises.
