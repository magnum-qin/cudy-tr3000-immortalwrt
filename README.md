# Cudy TR3000 ImmortalWrt 自动云编译

本项目基于 GitHub Actions 自动化编译适用于 **Cudy TR3000 (MediaTek MT7981 / Filogic 820)** 的 ImmortalWrt 固件。

## 固件特性
* **默认管理 IP**：`192.168.10.1`
* **默认主题**：Argon 现代化毛玻璃主题 (`luci-theme-argon`)
* **硬件级加速**：
  * 开启 **HWNAT 硬件流控加速**（通过 Turbo ACC 管理）
  * 开启 **WED (Wireless Ethernet Dispatch)** 硬件无线调度直传
  * 开启 **BBR 拥塞控制** 与 **FullCone NAT**
* **集成插件**：
  * **OpenClash**
  * **Passwall**
  * **TTYD 终端**、UPnP、定时重启等实用工具
* **内存优化**：开启 **zRAM Swap 内存压缩**，保障 512MB RAM 在高并发代理下稳定不崩溃。
