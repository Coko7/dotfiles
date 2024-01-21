# CRON Setup

1. First, make sur `cron` is installed and running. See: https://wiki.archlinux.org/title/Cron#Installation
2. Create new jobs for the current user: `crontab -e`
3. Put the following in the file (sets wallpaper every 30 minutes):
```cron
*/30 * * * * DISPLAY=:0.0 $HOME/.config/scripts/set-wallpaper.sh
```
