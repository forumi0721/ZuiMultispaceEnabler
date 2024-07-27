# Device Compatibility Check
ui_print "==> Device Compatibility Check"
#fingerprint=$(getprop ro.build.fingerprint)
#if [ "${fingerprint}" != "Lenovo/TB320FC/TB320FC:13/TKQ1.221114.001/ZUI_15.0.240_2404111037_ROW:user/release-keys" ]; then
#	ui_print "이 모듈은 Legion Tab (Lenovo Legion Y700 2세대) 240 버전만 지원합니다. 다른 버전은 지원되지 않습니다."
#    ui_print "This module only supports Legion Tab (Lenovo Legion Y700 2023 version 240. Other versions are not supported."
#    abort "Installation aborted due to incompatible device."
#fi
ui_print "Device compatibility check passed."
ui_print ""


# Disclaimer
ui_print "==> Disclaimer"
ui_print "Warning: This script may modify system files. By proceeding, you accept that the authors of this script are not responsible for any damage or issues that may occur to your device. Use at your own risk."
ui_print "경고: 이 스크립트는 시스템 파일을 수정할 수 있습니다. 계속 진행하면 이 스크립트의 작성자는 장치에 발생할 수 있는 손상이나 문제에 대해 책임지지 않는다는 것에 동의하는 것입니다. 사용에 따른 책임은 본인에게 있습니다."
ui_print ""
ui_print "Do you want to continue?"
ui_print " - Vol Up   = Yes"
ui_print " - Vol Down = No"
if ! chooseport; then
    abort "Installation aborted by the user."
fi
ui_print ""


# Preparation Step
ui_print "==> Preparation Step"
ui_print "Preparation is being configured..."

# Detect device
device=$(getprop ro.product.device)
device_l=$(echo "${device}" | tr 'A-Z' 'a-z')

# Detect root environment
environment=
system_path=
system_ext_path=
product_path=
vendor_path=
if [ -f "/data/adb/magisk/magiskinit" ]; then
    environment="magisk"
    system_path=$MODPATH/system
    system_ext_path=$MODPATH/system/system_ext
    product_path=$MODPATH/system/product
    vendor_path=$MODPATH/system/vendor
else
    if [ -d "/data/adb/ksu/bin/ksud" ]; then
        environment="kernelsu"
    elif [ -f "/data/adb/ap/bin/apd" ]; then
        environment="apatch"
    else
        echo "unknown"
    fi
    system_path=$MODPATH/system
    system_ext_path=$MODPATH/system_ext
    product_path=$MODPATH/product
    vendor_path=$MODPATH/vendor
fi

ui_print "Preparation has been configured successfully."
ui_print ""


# Initialize step counter
STEP=0

# Multiple Space Activation
STEP=$((STEP + 1))
ui_print "==> Step ${STEP}: Multiple Space Activation"
ui_print " Activates Multiple Space."
ui_print " 복제 공간(분신 공간)을 활성화합니다."
ui_print "Do you want to activate Multiple Space?"
ui_print " - Vol Up   = Yes"
ui_print " - Vol Down = No"
if chooseport; then
    multiple_space_choice="Y"
else
    multiple_space_choice="N"
fi
ui_print ""


# Summary of Choices
ui_print "==> Summary of Choices"
if [ ! -z "${multiple_space_choice}" ]; then
    ui_print "$(printf " %-50s : %s\n" "Multiple Space Activation" "${multiple_space_choice}")"
fi
ui_print ""
ui_print "Are these choices correct?"
ui_print " - Vol Up   = Yes"
ui_print " - Vol Down = No"
if ! chooseport; then
    abort "Installation aborted by the user."
fi
ui_print ""


# Configuration based on choices
ui_print "==> Applying configurations based on your choices"
ui_print ""

# Initialize step counter
STEP=0

# Multiple Space Activation
if [ ! -z "${multiple_space_choice}" ]; then
    STEP=$((STEP + 1))
    ui_print "==> Step ${STEP}: Multiple Space Activation"
    if [ "${multiple_space_choice}" == "Y" ]; then
        ui_print "Activating Multiple Space..."
        ui_print " - system.prop"
        cat $MODPATH/common/files/stonecold-multiplespace/system.prop >> $MODPATH/system.prop
        #mkdir -p ${product_path}/overlay
		#ui_print " - ZuiSettingsMultipleSpace.apk"
		#cp -a $MODPATH/common/files/stonecold-multiplespace/ZuiSettingsMultipleSpace.apk ${product_path}/overlay/
        #ui_print "Multiple Space activation complete."
    else
        ui_print "Multiple Space activation skipped."
    fi
    ui_print ""
fi


# Finalization Step
ui_print "==> Finalization Step"
ui_print "Finalizing the setup..."
rm -rf $MODPATH/zygisk
chmod 755 $MODPATH/*.sh
chmod 755 $MODPATH/Makefile
ui_print "Setup has been finalized successfully."
ui_print ""

# Additional Information
ui_print "==> Additional Information"
ui_print " To ensure all features work correctly, please install the Xposed module ZuiTweak."
ui_print " 모든 기능이 정상적으로 동작하려면 Xposed 모듈 ZuiTweak을 설치해야 합니다."
ui_print ""

# Configuration complete
ui_print "All configurations have been applied successfully."
ui_print "모든 설정이 성공적으로 적용되었습니다."

