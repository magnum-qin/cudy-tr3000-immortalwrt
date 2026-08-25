#!/bin/bash
# Description: OpenWrt DIY script part 2 (After Update feeds)

# 1. Modify default IP to 192.168.10.1
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 2. Modify default hostname
sed -i 's/ImmortalWrt/Cudy-TR3000/g' package/base-files/files/bin/config_generate

# 3. Set default theme to Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 4. Enable WED (Wireless Ethernet Dispatch)
mkdir -p package/base-files/files/etc/modules.d
echo "options mt7915e wed_enable=Y" > package/base-files/files/etc/modules.d/mt7915e

# 5. Enable passwordless login for TTYD (免密直接进入 root 终端)
mkdir -p package/base-files/files/etc/uci-defaults
cat << 'EOF' > package/base-files/files/etc/uci-defaults/99-custom-ttyd
uci set ttyd.@ttyd[0].command='/bin/login -f root'
uci commit ttyd
exit 0
EOF
chmod +x package/base-files/files/etc/uci-defaults/99-custom-ttyd

# 6. 直接拉取独立第三方插件到 package 目录
git clone --depth=1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
git clone --depth=1 https://github.com/gSpotx2f/luci-app-temp-status.git package/luci-app-temp-status
git clone --depth=1 https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
git clone --depth=1 https://github.com/gngpp/luci-app-design-config.git package/luci-app-design-config
git clone --depth=1 https://github.com/brvphoenix/luci-app-wrtbwmon.git package/luci-app-wrtbwmon
git clone --depth=1 https://github.com/brvphoenix/wrtbwmon.git package/wrtbwmon

# 7. 关键修复：修复 apk 包管理器对于版本号中多连字符的严格校验报错 (5.8.0-20240106 -> 5.8.0.20240106)
find package/luci-theme-design package/luci-app-design-config -name Makefile -exec sed -i 's/5.8.0-20240106/5.8.0/g' {} + 2>/dev/null || true
find package/ -name Makefile -exec sed -i 's/\([0-9]\+\)-\([0-9]\{8\}\)/\1.\2/g' {} + 2>/dev/null || true
