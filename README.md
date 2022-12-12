# Grub-OS-Switcher

Windows/Linux solution for changing the default Grub OS. Useful for rebooting into a different OS while remotely controlling a computer.

## How to Use

### Initial Setup
Create an extra FAT32 partition on a drive (usually the boot drive) of the smallest possible size (~33MB). This can easily be made in Windows or Linux. Place the files within `FAT32 Partition Files` into the newly created partition.

Once you are done, keep note of the drive label in Windows (eg: `A:\`) and the partition UUID in Linux (eg: `1234-ABCD`).

A sample `fstab` file is included that can be referenced to automatically mount your new FAT32 partition for editing. Simply find your `/etc/fstab` file, then append the contents of the `fstab` file to the end, replacing `<FAT32 PARTITION UUID>` with your FAT32 partition UUID, and `<FAT32 PARTITION MOUNT>` with the location at which you want the partition to mount. Something like `/boot/grubswitch` would suffice, however keep track of this location for later use.

### Configuring GRUB

Boot into Linux and find your GRUB configuration (Often found at `/boot/grub/grub.cfg`). In the same directory as `grub.cfg`, create a new file `custom.cfg`. This file will also be loaded and run by GRUB upon boot. Paste in the config from `Grub Config/custom.cfg`. You will need to replace `<FAT32 PARTITION UUID>` with your FAT32 partition UUID that corresponds to the FAT32 partition you created earlier. Additionally, ensure that the `set default=` lines are choosing the correct default boot entry with your setup. Each GRUB setup is different, and some may list the boot entries in a different order, so it is important to check this. The first entry in the list is 0. Additionally, more operating systems can be added by adding more entries to the file.

### Changing Boot Option

By editing the file `switch.cfg` file located in the FAT32 partition created earlier, the default boot option can be changed on any OS that supports reading FAT32, including Linux and Windows.

### Convenient Scripts

The scripts found in `Windows Scripts` and `Linux Scripts` can be used to simplify the process of editing the `switch.cfg` file. In Windows, you can create a shortcut for each script, then add the shortcuts to the Windows Start Menu for ease of access. Similarly, in Linux, if you have a desktop with a similar applications menu, they can be added to that menu for ease of access.

Before using the scripts, ensure that they are configured correctly. Make sure to set the value in `set os_switch=` to the numbers you used in the GRUB `custom.cfg`. Additionally, for Windows, replace `<FAT32 PARTITION DRIVE LETTER>` with the FAT32 partition drive letter, and for Linux, replace `<FAT32 PARTITION MOUNT>` with the mount point you chose for the FAT32 partition.

Test the scripts on both operating systems to ensure they are editing the `switch.cfg` file correctly and reboot to ensure it works. Once you are sure it is working correctly, you can then hide the partition from view if you'd like to reduce clutter. Winaero Tweaker works well at doing this in Windows.
