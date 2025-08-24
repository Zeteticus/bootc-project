#!/bin/bash

# Perform the scan and remediation
oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_stig_gui --report report.html --remediate /usr/share/xml/scap/ssg/content/ssg-rhel10-ds.xml
