# satip-axe

![Build firmware](https://github.com/Jalle19/satip-axe/workflows/Build%20firmware/badge.svg)

A maintained fork of [perexg/satip-axe](https://github.com/perexg/satip-axe), a firmware with minisatip for Inverto IDL-400s/Grundig GSS.BOX/Telestar Digibit R1

## Releases

Releases can be found [here](https://github.com/Jalle19/satip-axe/releases).

## Improvements in this fork

* Uses upstream minisatip without any custom patches
* DVB-CSA support in minisatip (due to CPU limitations only 1-2 streams can be decoded simultaneously)
* Uses newer version of OScam
* Reworked build system for easier development
* Leaner firmware image (obsolete versions of minisatip, tvheadend and Python have been removed)
* SFTP support for easier file configuration editing

## Build instructions

The build system used in this repository uses Docker. To build a new release, simply run:

```bash
make docker-clean-release
```

The release build will be in the `out/` directory.

## Flashing new firmware

There are two ways to flash new firmware to your device:

* using a USB stick (as explained in [upstream's dist/README](https://github.com/perexg/satip-axe/blob/master/dist/README))
* using the `upgrade-fw` script. Download the `.fw` file you want to flash to your device, then run `upgrade-fw path/to/file.fw`. The script only works for updating installations made to the device's flash memory - if dual-booting from a 
USB device you should not use it.

## Securing your installation

By default, the `root` password is `satip`. To harden the installation you should 
disable the password and use SSH keys to access the device.

1. Create the file `/etc/sysconfig/authorized_keys` containing your SSH public key
2. Reboot the device and verify that you can SSH into it without entering a password
3. Copy `/etc/passwd` to `/etc/sysconfig/passwd` and modify the password entry for `root` to be `*`. This disables the password completely.
4. Reboot once more. Now your device can only be accessed using SSH keys.

## More information

For general information, see [upstream's README](https://github.com/perexg/satip-axe#readme), [upstream's dist/README](https://github.com/perexg/satip-axe/blob/master/dist/README) and [upstream's debug/README](https://github.com/perexg/satip-axe/blob/master/debug/README.md)
