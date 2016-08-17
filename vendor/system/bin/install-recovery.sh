#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 29188096 f3e788a55d1a861f7f7e3dc7e97ab3c0809a6705 26030080 b1e2571ca795384c6ccaa545d909d74e03da3b96
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:29188096:f3e788a55d1a861f7f7e3dc7e97ab3c0809a6705; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:26030080:b1e2571ca795384c6ccaa545d909d74e03da3b96 EMMC:/dev/block/bootdevice/by-name/recovery f3e788a55d1a861f7f7e3dc7e97ab3c0809a6705 29188096 b1e2571ca795384c6ccaa545d909d74e03da3b96:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
