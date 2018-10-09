#!/usr/bin/env bash
rm -rf ~/.WebStorm*/config/eval
rm -rf ~/.java/.userPrefs/jetbrains/webstorm
sed -i '/evlsprt/d' ~/.WebStorm*/config/options/options.xml
sed -i '/evlsprt/d' ~/.java/.userPrefs/prefs.xml
find ~/.WebStorm* -type d -exec touch -t $(date +"%Y%m%d%H%M") {} +;
find ~/.WebStorm* -type f -exec touch -t $(date +"%Y%m%d%H%M") {} +;
