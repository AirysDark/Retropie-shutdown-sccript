this is not mine. i take no credit.
https://gitlab.com/unixispower/retroflag-picase

# RetroFlag Pi Case Safe Shutdown Script
Reimplementation of the [official shutdown script](
https://github.com/RetroFlag/retroflag-picase). This version of the
script utilizes the power switch to shut down the Pi and the reset switch to
close the running emulator in RetroArch (if running RetroPie or Recalbox).
This script has been tested with RetroPie 4.8, 2025.04-16 .


## Installation
The safe shutdown script can be installed directly from a Raspberry Pi that is
connected to the internet.

### RetroPie
The following steps are performed on a Raspberry Pi running RetroPie:

login as root user
1. Press F4 to close EmulationStation
2. ```shell
   wget https://github.com/AirysDark/Retropie-shutdown-sccript/archive/refs/heads/main.zip
   ```
3. ```shell
   unzip main.zip
   ```
4. ```shell
   cd Retropie-shutdown-sccript-main
   ```
5. ```shell
   sudo sh install.sh retropie
   ```
6. When prompted enter "Y" to reboot


### Download the Shutdown Script
Once you have shell access, download the shutdown script by running:

```shell
wget https://github.com/AirysDark/Retropie-shutdown-sccript/archive/refs/heads/main.zip
unzip main.zip
cd Retropie-shutdown-sccript-main
sudo sh install.sh retropie
```

Then continue the steps in the section that sent you here.


## Configuration
The shutdown script runs as a service and executes a shell script when a case
button is pressed. You can modify the script `/opt/retroflag-picase/shutdown.sh`
to customize which commands are ran for a particular button.


## Licensing
Source in this repository is licensed under the 2-clause BSD license, see
`LICENSE` for details.
