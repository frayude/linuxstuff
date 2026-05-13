# fix-bootloader.md
# How to fix Arch Linux bootloader on Acer laptops
# Acer BIOS only reads bootmgfw.efi, so we replace it with GRUB
#
# HOW TO USE:
# 1. Boot from Arch ISO (keep your USB flash drive!)
# 2. Connect to internet if needed: iwctl
# 3. Run the commands below one by one

# ─────────────────────────────────────────────
# MOUNT PARTITIONS
# ─────────────────────────────────────────────

# Mount root partition
mount /dev/nvme0n1p7 /mnt

# Mount boot partition
mount /dev/nvme0n1p6 /mnt/boot

# Create EFI mount point if it doesn't exist
mkdir -p /mnt/boot/efi

# Mount EFI partition
mount /dev/nvme0n1p4 /mnt/boot/efi

# Enter chroot environment
arch-chroot /mnt

# ─────────────────────────────────────────────
# REINSTALL GRUB
# ─────────────────────────────────────────────

# Install GRUB to EFI partition
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ARCH --recheck

# ─────────────────────────────────────────────
# REPLACE WINDOWS BOOTLOADER WITH GRUB
# ─────────────────────────────────────────────

# Backup original Windows bootloader (only if backup doesn't exist yet)
cp /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi.bak

# Replace Windows bootloader with GRUB
# Acer BIOS hardcoded to only read bootmgfw.efi
# GRUB will still detect and boot Windows via os-prober
cp /boot/efi/EFI/ARCH/grubx64.efi /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi

# ─────────────────────────────────────────────
# REGENERATE GRUB CONFIG
# ─────────────────────────────────────────────

# Generate grub.cfg, os-prober will detect Windows automatically
grub-mkconfig -o /boot/grub/grub.cfg

# Exit chroot
exit

# Reboot and remove the USB flash drive
reboot

# ─────────────────────────────────────────────
# RESTORE WINDOWS BOOTLOADER (OPTIONAL)
# ─────────────────────────────────────────────

# If you want to restore the original Windows bootloader, run:
cp /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi.bak /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi
