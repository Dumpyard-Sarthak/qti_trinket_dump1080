#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:f94b50e35f14f0fb55e23732ff02b2969da31123; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:05e16da46d21bbdedd4950aa98b5c169bcaec0b4 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:f94b50e35f14f0fb55e23732ff02b2969da31123 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
