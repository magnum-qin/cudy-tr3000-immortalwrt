#!/bin/bash
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# Add Argon Theme
echo 'src-git argon https://github.com/jerrykuku/luci-theme-argon.git' >>feeds.conf.default
echo 'src-git argonconfig https://github.com/jerrykuku/luci-app-argon-config.git' >>feeds.conf.default

# Add Passwall
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main' >>feeds.conf.default

# Add OpenClash
echo 'src-git openclash https://github.com/vernesong/OpenClash.git;master' >>feeds.conf.default
