#!/bin/bash
sed -i 's/192.168.1.1/192.168.50.11/g' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt/NiuWrt/g' package/base-files/files/bin/config_generate
sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate
sed -i 's/luci.main.lang=.*/luci.main.lang=zh_cn/' feeds/luci/modules/luci-base/root/etc/config/luci
sed -i '/helloworld/d' feeds.conf.default
