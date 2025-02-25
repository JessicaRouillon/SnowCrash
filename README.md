## Snowcrash

### 🗺️ Project Description

The `Snowcrash` project is a security-oriented challenge designed to introduce and enhance our understanding of system vulnerabilities, privilege escalation, and cybersecurity fundamentals. 🛡️💻

Through a series of progressively complex levels, we navigate through various security flaws, learning how to exploit them ethically while developing a hacker mindset in a controlled environment. 🔍

### 🌟 Key Features

- Discover and analyze common security vulnerabilities.
- Perform privilege escalation techniques.
- Interact with system files, permissions, and user privileges.
- Use various Linux commands and tools to bypass restrictions.
- Strengthen debugging and problem-solving skills.
- Develop an ethical hacker approach to security challenges.

### 🎮 Getting Started

#### 1. Download the .iso from the subject page

The SnowCrash.iso file necessary to run the project on a Virtual Machine is available on the intranet, on the [subject page](https://projects.intra.42.fr/projects/42cursus-snow-crash).

#### 2. Set up the environment

Snowcrash is designed to be run on a Unix-based system. Use a virtual machine or a remote server to simulate real-world security challenges.

If using a virtual machine, ensure you have:

- A Linux distribution (Debian-based recommended)
- Access to `ssh` for remote login
- The previously mentioned SnowCras.iso file downloaded
- Create the `vboxnet0` network: *Files > Tools > Network Manager*. Choose *Adapter 1*, select *Host-only Adapter*. Select `vboxnet0`.

#### 3. Connect to the system

If you are provided with an SSH-accessible environment:

```shell
ssh level00@<your VM's IP address>
```

Replace `level00` with the appropriate level username.

#### 4. Begin the challenge

Log into SnowCrash:
```shell
SnowCrash login: level00
password: level00
```

Each level contains a specific security flaw that must be exploited to obtain access to the next level. Use your problem-solving skills, research capabilities, and Linux knowledge to progress.

### 🔎 Help & Hints

- Utilize `man` pages (`man command`) for command documentation.
- Inspect file permissions with `ls -la`.
- Check running processes with `ps aux`.
- Look for suspicious files, hidden data, or misconfigured scripts.
- Remember, everything you need to escalate your privileges is within the system!

### 🚀 Example Commands

Here are some common Linux commands that might help you along the way:

```shell
ls -la  # List files with permissions
grep "flag" *  # Search for possible hints
env  # Check environment variables
cat /etc/passwd  # Inspect user accounts
find / -user level00 2>/dev/null  # Search for files owned by level00
strings filename  # Extract readable text from binaries
```

### ⚠️ Ethical Considerations

This project is strictly for educational purposes. Ethical hacking is a valuable skill when used responsibly. Do **not** apply these techniques outside of controlled environments.

Happy hacking! 🕵️‍♂️🔓

