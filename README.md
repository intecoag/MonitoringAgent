# Setup
1. Git-Repo in /mnt/contain-store/stacks clonen auf Ziel-Server
2. Aufstarten mit update.sh
3. Im Crontab update.sh einmal täglich ausführen lassen: aktualisiert das Image und das Repo
00 3 * * * cd /mnt/contain-store/stacks/MonitoringAgent && ./update.sh 1>/dev/null 2>/dev/null # Autoupdate MonitoringAgent