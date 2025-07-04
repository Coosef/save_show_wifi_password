
# WiFi Network Selector for Windows (wifi.bat)

A lightweight batch script to allow users to **scan and connect to available Wi-Fi networks** on a Windows machine via command-line interface (CLI). Ideal for kiosk environments, automation scenarios, or headless devices.

## 📦 Features

- Lists all available Wi-Fi SSIDs
- Allows user to select a network by number
- Connects using stored credentials (if available)
- Prompts for password if it's the first-time connection
- Simple and interactive terminal UI

## 📂 File

- `wifi.bat` — The main script file

## 🚀 Usage

1. **Download or clone this repository.**
2. Run the script by double-clicking `wifi.bat` or executing it in a Command Prompt window:

```cmd
wifi.bat
```

3. Follow the on-screen instructions:
   - Select a Wi-Fi network from the listed options
   - If credentials are saved, it will connect automatically
   - Otherwise, it will prompt you for a password

## 🖥️ Example Output

```
Available Wi-Fi Networks:
[1] HomeNetwork
[2] OfficeWiFi
[3] Guest_Access

Enter the number of the Wi-Fi you want to connect to:
```

## ⚠️ Requirements

- Windows 10 / 11
- Administrator privileges may be required to execute some `netsh` commands

## 🛠️ How It Works

This script utilizes `netsh wlan` commands to scan and manage wireless networks:
- `netsh wlan show networks` — Lists visible Wi-Fi networks
- `netsh wlan connect name="SSID"` — Connects to the specified network
- It performs minimal validation for safe input and ensures usability in non-GUI environments

## 📄 License

This project is licensed under the MIT License.

---

🛡️ Designed for environments where GUI-based network managers are not available, such as **public kiosks, RDP clients, or embedded terminals**.
