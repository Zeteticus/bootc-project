#!/bin/bash
set -euo pipefail

LOG_FILE="/var/log/fips-firstboot.log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "$(date): Starting FIPS first boot configuration"

# Ensure we have a separate /boot partition (required for FIPS)
if ! findmnt /boot > /dev/null 2>&1; then
    echo "ERROR: /boot must be a separate partition for FIPS mode"
    exit 1
fi

# Get the actual boot partition UUID
BOOT_UUID=$(findmnt -no UUID /boot)
if [ -z "$BOOT_UUID" ]; then
    echo "ERROR: Could not determine boot partition UUID"
    exit 1
fi

echo "Boot partition UUID: $BOOT_UUID"

# Update kernel parameters
echo "Updating kernel parameters..."
grubby --update-kernel=ALL --args="fips=1 boot=UUID=${BOOT_UUID}"

# Regenerate initramfs with FIPS modules
echo "Regenerating initramfs for FIPS..."
dracut -f --regenerate-all

# Mark as configured
touch /var/lib/fips-mode-enabled
echo "$(date): FIPS configuration completed"

echo "System will reboot in 30 seconds to activate FIPS mode..."
sleep 30
systemctl reboot
