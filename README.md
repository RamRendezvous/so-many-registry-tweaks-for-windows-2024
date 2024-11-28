# Windows Registry Tweaks Collection

A massive collection of advanced Windows registry tweaks for performance, customization, and system optimization. Perfect for power users and IT pros looking to squeeze every ounce of performance out of their systems.

---

   +-------+-------+
   |       |       |
   |   ☠   |       |
   +-------+-------+
   |       |       |
   |       |       |
   +-------+-------+


---

## Features

- Optimized performance for disk, network, and memory
- Advanced configurations for multitasking and resource management
- Enhancements for file system, CPU, and GPU tuning
- Unique, highly specialized tweaks for power users

---

## Usage

1. Clone the repository.
2. Backup your registry.
3. Choose the `.reg` file you need and merge it into your registry.

---

## Warning

Always back up your registry (see below) before applying any changes. Misusing registry tweaks can cause system instability or data loss.

---


## Does It Backup Everything? $${\color{gold}backupregistry.ps1}$$

    
    What It Covers:
    
        System Hives:
        
            HKEY_LOCAL_MACHINE\SYSTEM
            
            HKEY_LOCAL_MACHINE\SOFTWARE
            
            HKEY_LOCAL_MACHINE\SECURITY
            
            HKEY_LOCAL_MACHINE\SAM
            
            HKEY_USERS\.DEFAULT
            
        User-Specific Hives:
        
            HKEY_CURRENT_USER (derived from HKEY_USERS\<SID>).

 ##   These hives are backed up into .hiv files, providing a snapshot of the registry data.

    What It Doesn't Cover During Runtime:
        Volatile Keys: Some keys exist only in memory and aren't saved to disk, such as:
            HKEY_LOCAL_MACHINE\HARDWARE
            Certain temporary configurations created by active processes.
        Locked Keys: If a key is actively locked by a critical process (e.g., kernel-level operations), reg save might skip it.

    To Truly Get Everything:
      If you want every single registry key, including volatile and runtime keys:
            Perform an offline backup by copying the raw registry hive files from:

          C:\Windows\System32\Config

            Files to back up:
                SYSTEM
                SOFTWARE
                SECURITY
                SAM
                DEFAULT
                NTUSER.DAT (for user-specific settings).
                UsrClass.dat (application-specific settings).

## Restoring the Registry

To restore a hive from the backup, you can use reg restore:

`reg restore "HKEY_LOCAL_MACHINE\SYSTEM" "C:\RegistryBackup\SYSTEM.hiv"`

## Offline Backup for Complete Coverage
 If the system is offline, the most comprehensive method is to copy the raw registry hive files directly:
 Steps for Offline Backup:

    Boot into a recovery environment or connect the drive to another system.
    Navigate to:

    C:\Windows\System32\Config

    Copy the following files to a backup location:
        SYSTEM
        SOFTWARE
        SECURITY
        SAM
        DEFAULT
    For user-specific data, also back up:
        C:\Users\<username>\NTUSER.DAT
        C:\Users\<username>\AppData\Local\Microsoft\Windows\UsrClass.dat

## Advantages of Offline Backup:

    Captures every key, including those inaccessible or volatile during runtime.
    Ensures no key is skipped due to system locks.
