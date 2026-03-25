#!/bin/bash

# 后台IP
sed -i 's/192.168.1.1/192.168.50.11/g' package/base-files/files/bin/config_generate

# 主机名改为 NiuWrt（英文，稳定不乱码）
sed -i 's/ImmortalWrt/NiuWrt/g' package/base-files/files/bin/config_generate

# 时区
sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate

# 中文界面
sed -i 's/luci.main.lang=.*/luci.main.lang=zh_cn/' feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/luci.i18n.cmp=.*/luci.i18n.cmp=zh_cn/' feeds/luci/modules/luci-base/root/etc/config/luci

# 清理无效源
sed -i '/helloworld/d' feeds.conf.default
