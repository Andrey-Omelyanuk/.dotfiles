#sudo echo "100" | sudo tee  /sys/class/power_supply/BAT0/charge_control_end_threshold
#sudo echo "100" | sudo tee  /sys/devices/system/cpu/intel_pstate/max_perf_pct
#awk '{print $1*10^-6 " W"}' /sys/class/power_supply/BAT0/power_now
sudo echo "30" | sudo tee  /sys/devices/system/cpu/intel_pstate/max_perf_pct
echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

