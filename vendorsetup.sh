bold="$(tput bold)"

printf '%sCloning trees needed for kebab' $bold

echo 'device/oneplus/sm8250-common [1/6]'
if [ ! -d device/oneplus/sm8250-common ]; then git clone --depth=1 https://github.com/ProjectElixir-Devices/android_device_oneplus_sm8250-common.git -b tm-new device/oneplus/sm8250-common; else git -C device/oneplus/sm8250-common pull; fi

printf '\n'

echo 'changing line in common tree for LMODroid [1.5/6]'
sed -i 's/aosp/lmodroid/g' device/oneplus/sm8250-common/BoardConfigCommon.mk

printf '\n'

echo 'vendor/oneplus/kebab [2/6]'
if [ ! -d vendor/oneplus/kebab ]; then git clone --depth=1 https://github.com/Evolution-X-Devices/vendor_oneplus_kebab.git vendor/oneplus/kebab; else git -C vendor/oneplus/kebab pull; fi

printf '\n'

echo 'vendor/oneplus/sm8250-common [3/6]'
if [ ! -d vendor/oneplus/sm8250-common ]; then git clone --depth=1 https://github.com/ProjectElixir-Devices/android_vendor_oneplus_sm8250-common.git vendor/oneplus/sm8250-common; else git -C vendor/oneplus/sm8250-common pull; fi

printf '\n'

echo 'kernel/oneplus/sm8250 [4/6]'
if [ ! -d kernel/oneplus/sm8250 ]; then git clone --depth=1 https://github.com/HELLBOY017/kernel_oneplus_sm8250.git kernel/oneplus/sm8250; else git -C kernel/oneplus/sm8250 pull; fi

printf '\n'

echo 'hardware/oplus [5/6]'
if [ ! -d hardware/oplus ]; then git clone --depth=1 https://github.com/ProjectElixir-Devices/hardware-oplus.git -b tm-new hardware/oplus; else git -C hardware/oplus pull; fi

printf '\n'

echo 'changing line in TouchscreenGestureSettings.java for LMODroid [2.5/6]'

sed -i '0,/custom.hardware.LineageHardwareManager/{s//libremobileos.hardware.LineageHardwareManager/}' hardware/oplus/OPlusExtras/src/org/custom/oplus/OPlusExtras/Touch/TouchscreenGestureSettings.java
sed -i '0,/custom.hardware.TouchscreenGesture/{s//libremobileos.hardware.TouchscreenGesture/}' hardware/oplus/OPlusExtras/src/org/custom/oplus/OPlusExtras/Touch/TouchscreenGestureSettings.java

echo 'vendor/oneplus/camera [6/6]'
if [ ! -d vendor/oneplus/camera ]; then git clone --depth=1 https://gitlab.com/cjh1249131356/vendor_oneplus_camera.git vendor/oneplus/camera; else git -C vendor/oneplus/camera pull; fi

printf '\n'

echo 'nuking source audio repo and cloning with repo from arrow'
rm -rf hardware/qcom-caf/sm8250/audio && git clone --depth=1  https://github.com/ArrowOS/android_hardware_qcom_audio -b arrow-13.0-caf-sm8250 hardware/qcom-caf/sm8250/audio

printf '\n'

echo 'hardware/lineage/compat'
rm -rf hardware/lineage/compat && git clone --depth=1 https://github.com/LineageOS/android_hardware_lineage_compat.git hardware/lineage/compat

printf '\n'

echo 'Completed'
