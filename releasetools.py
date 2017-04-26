import common
import edify_generator
import copy


def ReplaceAssertions(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if 'show_progress(0.750000, 0);' in edify.script[i]:
            edify.script[i] = edify.script[i].replace('show_progress(0.750000, 0);', '''show_progress(0.750000, 0);
mount("ext4", "EMMC", "/dev/block/bootdevice/by-name/userdata", "/data", "");
ifelse(is_mounted("/system"), unmount("/system"));
ui_print("Installing system, please wait a few minutes ... ");''')


def FullOTA_InstallEnd(info):
    ReplaceAssertions(info)
    return

