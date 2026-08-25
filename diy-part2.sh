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
