#!/bin/bash
#================================================================================
# ImmortalWrt 官方源定制
# IP: 192.168.50.11  网关/DNS: 192.168.50.1
# 插件：ipsec-vpnd + openclash + openvpn-server + ddns-go
#================================================================================

# -------------------------- 固定网络配置（你指定的参数） --------------------------
# 修改后台管理 IP
sed -i 's/192.168.1.1/192.168.50.11/g' package/base-files/files/bin/config_generate

# 设置默认网关
sed -i '/gateway=/d' package/base-files/files/bin/config_generate
sed -i '/ipaddr>/a\                        set network.lan.gateway=\'192.168.50.1\' package/base-files/files/bin/config_generate

# 设置默认DNS
sed -i '/dns=/d' package/base-files/files/bin/config_generate
sed -i '/gateway>/a\                        set network.lan.dns=\'192.168.50.1\' package/base-files/files/bin/config_generate

# -------------------------- 基础设置 --------------------------
# 主机名
sed -i 's/ImmortalWrt/MyRouter/g' package/base-files/files/bin/config_generate

# 时区
sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate

# -------------------------- 强制默认中文 --------------------------
sed -i 's/luci.main.lang=.*/luci.main.lang=zh_cn/' feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/luci.i18n.cdb=.*/luci.i18n.cdb=zh_cn/' feeds/luci/modules/luci-base/root/etc/config/luci

# -------------------------- 安装官方插件 --------------------------
./scripts/feeds install luci-app-ipsec-vpnd
./scripts/feeds install luci-app-openclash
./scripts/feeds install luci-app-openvpn-server
./scripts/feeds install luci-app-ddns-go

# -------------------------- 安装中文语言包 --------------------------
./scripts/feeds install luci-i18n-base-zh-cn
./scripts/feeds install luci-i18n-firewall-zh-cn
./scripts/feeds install luci-i18n-ddns-go-zh-cn
./scripts/feeds install luci-i18n-openvpn-server-zh-cn

echo "diy-part2.sh 配置完成！"
