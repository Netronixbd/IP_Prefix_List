# 🌐 IP Prefix List for Major Internet Services

![Status](https://img.shields.io/badge/status-up-brightgreen)
![Update Interval](https://img.shields.io/badge/Update-24H-blue)
![Platform](https://img.shields.io/badge/platform-MikroTik-orange)
![License](https://img.shields.io/badge/license-Free-lightgrey)

---

## 📘 Description

This repository provides **IP Prefix Lists** for major global Internet services such as:
> Facebook • Google • Microsoft • Amazon • Netflix • Cloudflare • Akamai • PUBG • Free Fire • Telegram • and more...

These lists are ideal for **MikroTik**, **Juniper**, or any router where you want to create **Address Lists** or routing rules for specific Internet platforms.  

Data is collected and updated automatically from multiple trusted **WHOIS servers** and **public APIs**.

---

## 🔁 Update Interval
**Every 24 Hours**  
All prefix files are automatically refreshed to ensure accuracy and the latest IP ranges.

---

## ✅ Status
`ip-prefix-list` → 🟢 **UP & Active**

---

## ⚙️ How to Import on MikroTik Devices

You can import the ready `.rsc` file directly into your MikroTik router.

### **Option 1: Copy & Paste**
1. Open Winbox → New Terminal  
2. Copy the full content of `mikrotik_terminal.rsc`  
3. Paste it into the terminal and press **Enter**

### **Option 2: Upload & Import**
1. Download the `.rsc` file from this repo  
2. Upload it to your router’s **Files** section  
3. Run this command in terminal:
   ```bash
   import file-name=mikrotik_terminal.rsc
   ```

---

## 📦 Folder Structure

| Folder Name | Description |
|--------------|-------------|
| `AKAMAI` | Akamai IP Prefixes |
| `AMAZON` | Amazon IP Prefixes |
| `CLOUDFLARE` | Cloudflare IP Prefixes |
| `FACEBOOK` | Meta (Facebook, Instagram, WhatsApp) |
| `GOOGLE` | Google Services |
| `MICROSOFT` | Microsoft / Azure |
| `NETFLIX` | Netflix CDN Prefixes |
| `PUBG_TENCENT` | PUBG / Tencent Game Servers |
| `FREE-FIRE_GARENA` | Garena Free Fire Servers |
| `TELEGRAM` | Telegram Messenger Network |
| ...and many more! |

---

## 🧩 Sources

- Multiple WHOIS Servers  
- Public Internet Registries (ARIN, RIPE, APNIC, AFRINIC, LACNIC)  
- Verified API Services  

---

## 💬 Maintainer

**Author:** [Netronixbd](https://github.com/Netronixbd)  
**Maintained by:** Amir Hosan  
**Project Type:** Open Source Automation  
**Purpose:** Simplify MikroTik routing & filtering by categorized IP sets  

---

## 🙌 Thank You

If you find this project helpful, please ⭐ **star** the repo — it motivates future updates!  
Suggestions and contributions are always welcome.

---

> _Last Updated: Automatically every 24 hours by scheduled script_
