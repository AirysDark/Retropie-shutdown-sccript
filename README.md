this is not mine. i take no credit.
https://gitlab.com/unixispower/retroflag-picase

# RetroFlag Pi Case Safe Shutdown Script
Reimplementation of the [official shutdown script](
https://github.com/RetroFlag/retroflag-picase). This version of the
script utilizes the power switch to shut down the Pi and the reset switch to
close the running emulator in RetroArch (if running RetroPie or Recalbox).
This script has been tested with RetroPie 4.4, Recalbox 6.0-DragonBlaze, and
OSMC 2019.06-1 .


## Installation
The safe shutdown script can be installed directly from a Raspberry Pi that is
connected to the internet.

### RetroPie
The following steps are performed on a Raspberry Pi running RetroPie:

1. Press F4 to close EmulationStation
2. [Download the shutdown script](#download-the-shutdown-script)
3. Run `sudo sh install.sh retropie`
4. When prompted enter "Y" to reboot

### Recalbox
The following steps are performed on a Raspberry Pi running Recalbox:

1. Press F4 to close EmulationStation
2. Wait for the Recalbox splash screen to appear
3. Press ALT+F2 to switch to a login shell
4. Login with username `root` and password `recalboxroot`
5. [Download the shutdown script](#download-the-shutdown-script)
6. Run `sh install.sh recalbox`
7. When prompted enter "Y" to reboot.

### OSMC
The following steps are performed on a Raspberry Pi running OSMC:

1. Navigate to the power icon in Kodi
2. Select Exit/Quit
3. Wait for the OSMC splash screen to appear
4. Press ESC on your keyboard while the spash screen is shown
4. Login with username `osmc` and password `osmc`
6. [Download the shutdown script](#download-the-shutdown-script)
7. Run `sudo sh install.sh osmc`
8. When prompted enter "Y" to reboot.

### Download the Shutdown Script
Once you have shell access, download the shutdown script by running:

```shell
wget https://github.com/AirysDark/Retropie-shutdown-sccript/archive/refs/heads/main.zip
unzip Retropie-shutdown-sccript-main.zip
cd Retropie-shutdown-sccript-main
```

Then continue the steps in the section that sent you here.


## Configuration
The shutdown script runs as a service and executes a shell script when a case
button is pressed. You can modify the script `/opt/retroflag-picase/shutdown.sh`
to customize which commands are ran for a particular button.


## Licensing
Source in this repository is licensed under the 2-clause BSD license, see
`LICENSE` for details.
