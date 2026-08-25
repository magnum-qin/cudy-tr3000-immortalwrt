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

# 额外针对编译期 ttyd.config 模板进行替换做双重保障
find feeds/ package/ -name "ttyd.config" -exec sed -i "s?/bin/login?/bin/login -f root?g" {} + 2>/dev/null || true
