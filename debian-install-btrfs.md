### Debian install with correct BTRFS

expert install

```
umount /target/boot/efi
umount /target

mount /dev/sdX /mnt
cd /mnt
mv @rootfs @
btrfs subvolume create @home
btrfs subvolume create @snapshots
btrfs subvolume list .
```

```
mount -o defaults,subvolid=256 /dev/sdX /target
mkdir -p /target/boot/efi
mkdir -p /target/home
mkdir -p /target/.snapshots
mount -o defaults,subvolid=257 /dev/sdX /target/home
mount -o defaults,subvolid=258 /dev/sdX /target/.snapshots
mount /dev/sdX /target/boot/efi
```

```
nano /target/etc/fstab

    change subvol to subvolid=  x3
```

```
nvme.noacpi=1 mem_sleep_default=deep acpi_osi='!Windows 2020' loglevel=3
