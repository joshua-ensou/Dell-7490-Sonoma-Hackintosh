# Dell-7490-Sonoma-Hackintosh

OpenCore EFI for macOS Sonoma on Dell 7490 with Intel i5 8th Gen CPU.



![Dell Github](https://raw.githubusercontent.com/joshua-ensou/comp2156/main/src/images/sonoma.png)





## Tested macOS Version

- macOS Sonoma 14.0 - 14.3


## System Hardware

- CPU:  Intel Core i5-8250U
- iGPU: Intel UHD Graphics 620
- RAM:  8GB 2400Mhz DDR4
- SSD:  SK hynix SC311 SATA 256GB
- WiFi: Intel Wireless 8265
- Display: 1920x1080 FullHD IPS
- Sound Card: Realtek ALC256
- LAN: Intel I219-LM4

### Bootloader

OpenCore 0.8.8


## BIOS Settings

- Boot mode: UEFI
- Fast Boot: Auto
- SecureBoot: Disable
- SATA Mode: AHCI 


### SMBIOS

MacBookPro15,2


## What's working

 
 - [x] CPU Speedstep

 - [x] iGPU acceleration

 - [x] Battery Management
 
 - [x] Sleep/Wake
 
 - [x] Internal Speakers
 
 - [x] Internal Microphone
 
 - [x] WiFi (2.4Ghz + 5Ghz)
 
 - [x] Bluetooth

 - [x] Ethernet

 - [x] HDMI + audio over HDMI

 - [x] Touchpad with Gestures + Trackpad + Buttons

 - [x] Web Camera

 - [x] USB 3.0

 - [x] MicroSD card reader 

 - [x] Native hotkeys support with Fn keys (Volume Fn+F2/F3 and Screen Brightness Fn + F11/F12)
 
 - [x] USB-C Data transfer
 
 - [x] Thunderbolt (needs to plug a device before boot)

 - [x] FileVault 2

 - [x] Location Services

 - [x] USB-C charging

 - [x] USB-C DP-alt Mode



## Optional Alternative

 - [x] Connecting to hidden WiFi SSD (use itlwm)

 - [x] iMessage  (use itlwm)
 
 - [x] FaceTime (use itlwm)


# Notes

* If the installer stuck at the apple logo during installation with "0x0 is not a System or Data Volume", please include ApfsDriverLoader.efi into your drivers. Set min date -1 minversion -1. 

* To turn off the show the desktop when clicking wallpaper, set "Click wallpaper to reveal desktop" to " Only in Stage Manager" in Desktop & Dock Settings.

* If UI running a bit  sluggish, turn of widgets in Desktop and Dock.

* When using time machine to migrate your files from Ventura to Sonoma, don't forget to check the storage if the backup is not deleted after migration to save space.

* Generate a genuine mac book pro serial number with SMBIOS after installation.

OCAuxiliaryTools at https://github.com/ic005k/OCAuxiliaryTools.

OpenIntelWireless at https://github.com/OpenIntelWireless.

SMBIOS at https://github.com/corpnewt/GenSMBIOS. 

