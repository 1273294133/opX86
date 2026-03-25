#!/bin/bash
#================================================================================
# 纯官方 Luci 源 | 仅修改后台IP：192.168.50.11
# 网关、DNS 保持默认不动
#================================================================================

# -------------------------- 只改后台IP --------------------------
sed -i 's/192.168.1.1/192.168.50.11/g' package/base-files/files/bin/config_generate

# -------------------------- 主机名 & 时区 --------------------------
sed -i 's/ImmortalWrt/MyRouter/g' package/base-files/files/bin/config_generate
sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate

# -------------------------- 默认中文 --------------------------
sed -i 's/luci.main.lang=.*/luci.main.lang=zh_cn/' feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/luci.i18n.cdb=.*/luci.i18n.cdb=zh_cn/' feeds/luci/modules/luci-base/root/etc/config/luci

echo "diy-part2 配置完成 ✅"
