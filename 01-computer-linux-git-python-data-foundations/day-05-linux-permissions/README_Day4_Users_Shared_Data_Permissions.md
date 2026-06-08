# 🔐 Day 5 – Linux File Permissions, Users & Shared Data Access

## What I Did Today 🚀

Today was all about learning how Linux controls access to files, folders, and users like a tiny security kingdom 🐧🔐

The official Day 5 task was:

> **Create analyst, engineer, and service users; make shared data folders with correct read/write permissions and document access tests.**

So today was not just “learn `chmod` and move on.”

Today I actually practiced how access control works in a realistic environment.

I created different types of users:

- `analyst`
- `engineer`
- `service`

Then I created shared data folders and configured permissions so each user had the correct level of access.

Basically, I built a small Linux access-control lab where different users had different powers.

Linux said:

> “Not everyone gets the same badge.” 😭🪪

This felt like a real security engineering task because I had to think about:

- Who should own the folder?
- Which group should have access?
- Who should be able to read?
- Who should be able to write?
- Who should be blocked?
- How do I test that permissions actually work?

By the end of today, I wasn’t just memorizing permission numbers.

I was designing and testing access rules.

That is a whole different level of Linux brain unlock 🧠⚡

---

## 🎯 Today's Objectives

- Create multiple Linux users
- Understand how users and groups affect file permissions
- Create shared folders for data access
- Apply read/write/execute permissions correctly
- Use ownership and group ownership to control access
- Test permissions by switching between users
- Document what worked and what failed
- Connect Linux permissions to security and data engineering

---

## 🧠 Key Concepts I Learned

## 👤 Users in Linux

Linux users represent accounts that can log into or run processes on the system.

Today I worked with three users:

| User | Role | Purpose |
|---|---|---|
| `analyst` | Security/data analyst | Needs access to read and sometimes write processed data |
| `engineer` | Data/security engineer | Needs stronger access to create, modify, and manage shared data |
| `service` | Service account | Represents an automated process or pipeline account |

This made the lab feel more realistic because real systems often separate human users from service accounts.

A service account is not really a “person.”

It is usually used by applications, jobs, scripts, or pipelines.

Security brain says:

> Human users and automated users should not all share the same powers 😤🔐

---

## 👥 Groups in Linux

Groups allow multiple users to share access without giving permissions to everyone.

Instead of giving access to each user one by one, I can place users into a group and give that group permissions on a folder.

Example group idea:

```bash
data-team
```

Users inside the group:

```text
analyst
engineer
service
```

Then folders can be owned by that group.

This is cleaner than making everything public.

Linux groups are basically:

> “You’re on the team, so you get the team badge.” 🪪

---

## 🧾 Where User and Group Info Lives

Linux stores user and group information in important system files.

| File | What It Stores |
|---|---|
| `/etc/passwd` | User account information like username, UID, GID, home directory, and login shell |
| `/etc/group` | Group names and group membership |
| `/etc/shadow` | Encrypted password information |

To check a user’s identity and groups, I used:

```bash
id analyst
id engineer
id service
```

Example style output:

```bash
uid=1001(analyst) gid=1001(analyst) groups=1001(analyst),1004(data-team)
```

This tells me:

- the user exists
- the user has a UID
- the user has a primary group
- the user belongs to additional groups

---

# 🔐 Understanding Permissions

Linux uses three basic permission types:

| Permission | Symbol | File Meaning | Directory Meaning |
|---|---|---|---|
| Read | `r` | Open and read a file | List directory contents |
| Write | `w` | Modify or overwrite a file | Create, delete, or rename files inside the directory |
| Execute | `x` | Run a file as a program/script | Enter the directory with `cd` |

This was one of the biggest concepts today:

> Execute permission means different things depending on whether it is on a file or directory.

For files:

```text
x = run the file
```

For directories:

```text
x = enter the folder
```

So for shared folders, execute permission is super important.

Without `x`, users may not even be able to enter the directory.

---

# 🧾 Reading Permission Strings

To inspect permissions, I used:

```bash
ls -l
```

Example:

```bash
drwxrwx--- 2 engineer data-team 4096 Jun 8 10:30 shared-data
```

Breaking it down:

```text
d   rwx   rwx   ---
│    │     │     │
│    │     │     └── others have no access
│    │     └──────── group can read/write/enter
│    └────────────── owner can read/write/enter
└─────────────────── directory
```

Meaning:

| Section | Value | Meaning |
|---|---|---|
| File type | `d` | This is a directory |
| Owner permissions | `rwx` | Owner can list, create/delete, and enter |
| Group permissions | `rwx` | Group can list, create/delete, and enter |
| Others permissions | `---` | Everyone else is blocked |
| Owner | `engineer` | Folder owner |
| Group | `data-team` | Group owner |

This permission pattern is useful for shared team folders.

---

# 🔢 Octal Permissions

Linux permissions can also be written as numbers.

| Permission | Number |
|---|---:|
| Read | `4` |
| Write | `2` |
| Execute | `1` |

You add them together:

| Number | Permission | Meaning |
|---:|---|---|
| `0` | `---` | No access |
| `1` | `--x` | Execute only |
| `2` | `-w-` | Write only |
| `3` | `-wx` | Write + execute |
| `4` | `r--` | Read only |
| `5` | `r-x` | Read + execute |
| `6` | `rw-` | Read + write |
| `7` | `rwx` | Read + write + execute |

Examples:

| Permission | Meaning |
|---|---|
| `770` | Owner and group full access, others blocked |
| `750` | Owner full access, group read/execute, others blocked |
| `700` | Only owner has full access |
| `755` | Owner full access, everyone else read/execute |
| `644` | Owner read/write, group and others read-only |
| `600` | Only owner can read/write |

For today’s shared folders, `770` and `750` are especially important.

Why?

Because they allow team-based access without exposing the folder to everyone.

---

# 🏗️ Mini Project – Users & Shared Data Folders

## 📌 Task

The task was to:

> Create `analyst`, `engineer`, and `service` users; make shared data folders with correct read/write permissions and document access tests.

So I designed a simple shared data access setup.

---

## 👤 Step 1 – Create the Users

I created three users:

```bash
sudo useradd -m analyst
sudo useradd -m engineer
sudo useradd -m service
```

What this does:

| Command | Meaning |
|---|---|
| `useradd` | Creates a new Linux user |
| `-m` | Creates a home directory for the user |

So:

```bash
sudo useradd -m analyst
```

creates the user and gives them a home directory like:

```text
/home/analyst
```

I could verify the users with:

```bash
id analyst
id engineer
id service
```

---

## 🔑 Step 2 – Set Passwords for the Users

Each user needs a password if I want to test switching into the account.

```bash
sudo passwd analyst
sudo passwd engineer
sudo passwd service
```

This lets me set or update the user passwords securely.

I learned that hardcoding passwords into commands is not ideal for real environments.

Using `passwd` interactively is safer for practice.

---

## 👥 Step 3 – Create Groups for Access Control

I created groups to manage shared folder access.

Example groups:

```bash
sudo groupadd data-team
sudo groupadd pipeline-services
```

| Group | Purpose |
|---|---|
| `data-team` | Shared group for analyst and engineer |
| `pipeline-services` | Group for service/pipeline-related access |

Then I added users to the groups:

```bash
sudo usermod -aG data-team analyst
sudo usermod -aG data-team engineer
sudo usermod -aG pipeline-services service
```

Important:

```bash
-aG
```

means append the user to a supplementary group.

This matters because using `-G` without `-a` can accidentally replace existing group memberships.

Linux said:

> “One missing `a` and suddenly your groups are gone.” 💀

---

## 📁 Step 4 – Create Shared Data Folders

I created shared folders for different access needs.

Example structure:

```text
/data-platform/
├── shared/
│   ├── raw/
│   ├── curated/
│   └── service-drop/
```

Commands:

```bash
sudo mkdir -p /data-platform/shared/raw
sudo mkdir -p /data-platform/shared/curated
sudo mkdir -p /data-platform/shared/service-drop
```

What `-p` does:

| Option | Meaning |
|---|---|
| `-p` | Creates parent directories if they do not already exist |

So Linux can create the full path without complaining.

Very polite behavior from a usually savage system 😭

---

## 👑 Step 5 – Set Ownership

I assigned ownership so the right users/groups controlled the folders.

```bash
sudo chown -R engineer:data-team /data-platform/shared/raw
sudo chown -R engineer:data-team /data-platform/shared/curated
sudo chown -R service:pipeline-services /data-platform/shared/service-drop
```

What this means:

| Folder | Owner | Group |
|---|---|---|
| `/data-platform/shared/raw` | `engineer` | `data-team` |
| `/data-platform/shared/curated` | `engineer` | `data-team` |
| `/data-platform/shared/service-drop` | `service` | `pipeline-services` |

The owner has primary control.

The group allows team-based access.

---

## 🔐 Step 6 – Apply Permissions

I applied permissions based on what each folder should allow.

```bash
sudo chmod 770 /data-platform/shared/raw
sudo chmod 750 /data-platform/shared/curated
sudo chmod 770 /data-platform/shared/service-drop
```

Permission meaning:

| Folder | Permission | Meaning |
|---|---|---|
| `raw` | `770` | Owner and group can read/write/enter. Others blocked |
| `curated` | `750` | Owner can write. Group can read/enter. Others blocked |
| `service-drop` | `770` | Service owner and service group can read/write/enter. Others blocked |

Why this design?

- `raw` allows the data team to add or update incoming data.
- `curated` lets the engineer manage trusted outputs while the analyst can read.
- `service-drop` is for service/pipeline activity and should not be public.

This is the beginning of least-privilege thinking.

Not everyone gets write access everywhere.

---

## 🧬 Step 7 – Optional Setgid for Shared Group Folders

For shared folders, I can enable setgid so new files inherit the folder’s group.

```bash
sudo chmod g+s /data-platform/shared/raw
sudo chmod g+s /data-platform/shared/curated
```

Why this matters:

If `engineer` creates a file inside the folder, the file should stay associated with `data-team`.

Setgid helps keep group ownership consistent.

Without it, files may get created with the user’s primary group instead.

This can cause annoying access bugs later.

Setgid is basically Linux saying:

> “Anything born in this folder joins the folder family.” 👶📁

---

# 🧪 Access Tests

This was a major part of today’s task.

It is not enough to set permissions.

I need to prove they work.

So I documented access tests by switching users and trying read/write actions.

---

## Test 1 – Analyst Can Access Raw Folder

Switch to analyst:

```bash
su - analyst
```

Try entering the raw folder:

```bash
cd /data-platform/shared/raw
```

Try creating a test file:

```bash
touch analyst_raw_test.txt
```

Expected result:

```text
Success
```

Why?

Because `analyst` belongs to `data-team`, and `raw` has `770` permissions for owner/group.

---

## Test 2 – Analyst Can Read Curated Folder

As analyst:

```bash
cd /data-platform/shared/curated
ls
```

Expected result:

```text
Success
```

Why?

Because curated has `750`.

The group can read and enter.

---

## Test 3 – Analyst Should Not Write to Curated Folder

As analyst:

```bash
touch analyst_curated_test.txt
```

Expected result:

```text
Permission denied
```

Why?

Because curated is designed so the engineer controls final trusted data.

The analyst can read curated outputs, but should not modify them.

This protects data integrity.

---

## Test 4 – Engineer Can Write to Raw and Curated

Switch to engineer:

```bash
su - engineer
```

Test raw:

```bash
touch /data-platform/shared/raw/engineer_raw_test.txt
```

Test curated:

```bash
touch /data-platform/shared/curated/engineer_curated_test.txt
```

Expected result:

```text
Success
```

Why?

Because `engineer` owns those folders and has full access.

The engineer is responsible for managing data structure and final outputs.

---

## Test 5 – Service Can Write to Service Drop Folder

Switch to service:

```bash
su - service
```

Run:

```bash
touch /data-platform/shared/service-drop/service_test.txt
```

Expected result:

```text
Success
```

Why?

Because service owns the service-drop folder and belongs to the correct service group.

This simulates a pipeline or automated job writing output.

---

## Test 6 – Service Should Not Access Data Team Folders

As service:

```bash
cd /data-platform/shared/raw
```

Expected result:

```text
Permission denied
```

Why?

Because `service` is not part of `data-team`.

This proves the service account is restricted.

Service accounts should only access what they need.

No extra powers.

No free roaming.

No “just vibes” permissions 😭

---

## Test 7 – Others Are Blocked

A user who is not in `data-team` or `pipeline-services` should not be able to access the protected folders.

Expected result:

```text
Permission denied
```

This confirms that `others` permissions are set to `---`.

---

# 📊 Access Matrix

| Folder | Analyst | Engineer | Service | Others |
|---|---|---|---|---|
| `/data-platform/shared/raw` | Read/Write | Read/Write | No Access | No Access |
| `/data-platform/shared/curated` | Read Only | Read/Write | No Access | No Access |
| `/data-platform/shared/service-drop` | No Access | No Access | Read/Write | No Access |

This table helped me clearly see whether my permissions matched the goal.

This is the kind of access matrix real teams use when designing secure systems.

---

# 🛠️ Commands Practiced Today

| Tool / Command | What It Does | Example |
|---|---|---|
| `useradd -m` | Creates a user with a home directory | `sudo useradd -m analyst` |
| `passwd` | Sets or changes a user password | `sudo passwd analyst` |
| `groupadd` | Creates a new group | `sudo groupadd data-team` |
| `usermod -aG` | Adds a user to a group without removing existing groups | `sudo usermod -aG data-team analyst` |
| `id` | Displays UID, GID, and group memberships | `id analyst` |
| `groups` | Shows groups a user belongs to | `groups analyst` |
| `mkdir -p` | Creates folders, including parent folders | `sudo mkdir -p /data-platform/shared/raw` |
| `chown` | Changes owner and group ownership | `sudo chown engineer:data-team folder` |
| `chown -R` | Changes ownership recursively | `sudo chown -R engineer:data-team /data-platform` |
| `chmod` | Changes permissions | `sudo chmod 770 folder` |
| `chmod g+s` | Enables setgid on a directory | `sudo chmod g+s shared-folder` |
| `ls -l` | Displays permissions and ownership | `ls -l /data-platform/shared` |
| `su - username` | Switches to another user | `su - analyst` |
| `whoami` | Confirms the current user | `whoami` |
| `touch` | Creates an empty file to test write access | `touch test.txt` |
| `cd` | Tests whether a user can enter a directory | `cd /data-platform/shared/raw` |
| `cat` | Tests whether a user can read file content | `cat file.txt` |
| `echo` | Writes text into files during testing | `echo test > file.txt` |
| `rm` | Tests whether a user can delete files | `rm test.txt` |
| `sudo` | Runs commands with admin privileges | `sudo chmod 770 folder` |

---

# 🔍 Permission Patterns Used Today

| Permission | Meaning | Where It Fits |
|---|---|---|
| `770` | Owner and group full access, others blocked | Shared write folder for trusted group |
| `750` | Owner full access, group read/execute, others blocked | Curated folder where group can read but not write |
| `700` | Only owner full access | Private directories or service-only folders |
| `640` | Owner read/write, group read, others blocked | Shared read-only data files |
| `600` | Only owner read/write | Secrets, keys, sensitive config files |

---

# 🔐 Why This Matters in Security Data Engineering

This task connects directly to security data engineering.

In real environments, security data is sensitive.

Examples:

- authentication logs
- firewall logs
- CloudTrail events
- endpoint telemetry
- detection outputs
- incident evidence
- pipeline configs
- secrets

If permissions are too open, people or processes can modify data they should not touch.

If permissions are too strict, analysts and pipelines cannot do their jobs.

Good permissions balance:

```text
Access
Security
Usability
Integrity
```

For example:

| Asset | Permission Goal |
|---|---|
| Raw logs | Protect from tampering |
| Curated datasets | Allow analysts to read trusted outputs |
| Pipeline folders | Allow service accounts to write only where needed |
| Configs | Restrict sensitive settings |
| Scripts | Only engineers should modify production logic |
| Evidence files | Preserve integrity during investigations |

This is why least privilege matters.

Give users only the access they need.

Nothing more.

Linux permissions are basically security policy written into the filesystem.

---

# 💥 Challenges I Faced

- Understanding which users should belong to which groups
- Remembering that group membership may require a new login session to apply
- Understanding why directories need execute permission
- Deciding which folders should be read-only vs read/write
- Testing access as different users without confusing myself
- Remembering that `770` blocks others completely
- Understanding why `curated` should not be writable by everyone
- Realizing that setting permissions is not enough; I also need to test them

---

# 💡 How I Solved It

- Used `id username` to verify users and groups
- Used `ls -l` to inspect ownership and permissions
- Used `su - username` to test access as each user
- Used `touch` to test write access
- Used `cd` and `ls` to test directory access
- Used permission numbers like `770` and `750` intentionally
- Used groups instead of giving access to everyone
- Created an access matrix to make the design easier to understand

---

# 🏆 What I Can Do Now

After Day 5, I can:

✅ Create Linux users for different roles

✅ Create groups for shared access

✅ Add users to groups safely using `usermod -aG`

✅ Create shared folders for data workflows

✅ Set folder ownership with `chown`

✅ Set read/write permissions with `chmod`

✅ Understand `770`, `750`, `700`, `640`, and `600`

✅ Test access by switching users

✅ Document successful and failed access tests

✅ Design a basic least-privilege folder structure

✅ Explain why Linux permissions matter in security data engineering

Basically...

I can now create a small secure shared data environment and prove the access rules work 😭🔥

---

# 📚 Resources Used

- Linux Foundations practice
- Kali Linux terminal
- Linux manual pages
- File permissions notes
- Hands-on user and group management
- Access testing with multiple users
- ChatGPT guidance and explanations

---

# 🧃 Final Thoughts

Today felt like going from “I know permissions exist” to “I can actually design access control.”

Creating `analyst`, `engineer`, and `service` users made the lesson feel real.

The shared folders helped me understand why ownership, groups, and permissions matter in actual systems.

The biggest lesson was:

> Permissions are not done until they are tested.

Setting `chmod` is one thing.

Switching users and proving who can read, write, or get blocked is where the real learning happened.

This was honestly giving baby security engineer energy 😭🔐

Because in real companies, this is the kind of thinking that protects logs, pipelines, configs, and sensitive data.

Today was not just Linux practice.

It was access-control engineering.

Security Data Engineer Zanobuhle loading...

███████░░░ 72% 🚀🔐📊
