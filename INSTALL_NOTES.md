USB Flash Install
-----------------

I took a USB thumb drive, used `fdisk` to delete the partion it came with and
add a single new Linux partition, flagged as bootable.

I then formatted the partition with `mkfs.ext4` but in retrospect I *probably*
should have used ext2 as journaling probably hurts performance on a flash drive.

Building the LFS on it was incredibly slow. In future, I will build to an empty
directory on an actual SSD/Hard Disk and then copy the contents to the flash
drive (maybe without a lot of the `/usr/share/doc` stuff).

It *almost* worked. The `grub-install` command worked and it started to boot but
kernel panicked because it could not mount the root file system. The problem is
*probably* a kernel option, I have been given some suggestions.

So to continue with the project, I built from LFS 11.3 straight to hard disk
without going through the thumb drive (just do not run `PRENINE.sh`).

I will try to figure out a kernel configuration that boots fron the flash drive,
I want an emergency boot device. But at the *moment* that is lower priority.


Hard Drive Install
------------------

This worked but there are some issues.

### Console Font

I dislike the console font, I need to look at which console font I defined for
use in LFS 11.3 as I like it better.

### Network

The network did not come up. The `ip link` command did show that my MAC address
was associated with my defined `lan0` interface but the network did not come up.

I removed the `/etc/systemd/network/10-lan0.link` file and restarted the network
service to see what `dbus` called my interface, and then edited the
`/etc/systemd/network/10-lan0.network` file to use that name and again restarted
the network and this time it started.

I almost wonder if maybe SystemD ran `10-lan0.network` before `10-lan0.link` so
that the link was not yet defined? I will look at it.

### Timezone

My hardware clock is UTC and but the `date` command shows the UTC time but
calls it `PDT` so when I set the time zone, I must have done so incorrectly. I
will look into it.
