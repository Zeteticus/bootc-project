#!/bin/bash
# Script to verify FIPS mode status
if [ "$(cat /proc/sys/crypto/fips_enabled 2>/dev/null)" = "1" ]; then
    echo "FIPS mode: ENABLED"
    dmesg | grep -i fips | tail -5
else
    echo "FIPS mode: DISABLED"
fi
