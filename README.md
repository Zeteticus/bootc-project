# RHEL9 Bootc SCAP Hardened Image Builder

A comprehensive solution for creating SCAP-hardened RHEL9 bootc container images with installation ISO generation and network-based update distribution capabilities.

## Overview

This project provides tooling to:
- Build SCAP-hardened RHEL9 bootc container images
- Generate installation ISOs for bare metal and VM deployment
- Set up container registries for network-based system updates via HTTPS

## Project Structure

```
.
├── auth.json                      # Global authentication configuration
├── bootc-buildiso/
│   ├── auth.json                  # ISO build authentication
│   ├── buildiso.sh                # ISO generation script
│   ├── config.toml                # ISO build configuration
│   └── output/
│       ├── bootiso                # Generated bootable ISO output
│       └── manifest-iso.json      # ISO build manifest
├── README.md                      # This documentation
├── registry-certs/
│   ├── domain.crt                 # Registry SSL certificate
│   └── domain.key                 # Registry SSL private key
├── registry-data/
│   ├── auth.json                  # Registry authentication
│   └── start-registry.sh          # Registry startup script
└── rhel9-bootc/
    ├── auth.json                  # Bootc build authentication
    ├── build-bootc-scapped.sh     # Main build script for bootc image
    ├── config.toml                # Bootc build configuration
    ├── Containerfile              # Container build definition
    └── LICENSE                    # License file
```

## Prerequisites

- Podman installed and configured
- Red Hat subscription with registry.redhat.io access
- Sufficient disk space for image builds
- Root or appropriate container privileges

## Quick Start

### 1. Build SCAP-Hardened Bootc Image

Navigate to the build directory and execute the build script:

```bash
cd rhel9-bootc
./build-bootc-scapped.sh
```

**Verification:**
After the build completes, verify the image creation:

```bash
podman images
```

You should see an image named: `localhost/rhel9-bootc-scapped-v1.2`

### 2. Set Up Container Registry

For network-based updates, configure the container registry using the provided startup scripts in the `registry-data` directory.

```bash
cd registry-data
./start-registry.sh
```

Then, push the scapped imaged like this:
```
podman push localhost/rhel9-bootc-scapped-v1.2:latest localhost:5000/myregistry/rhel9-bootc-scapped-v1.2:latest
```
Check it with:
```
curl -k https://192.168.1.18:5000/v2/_catalog
```
### 3. Generate Installation ISO

Create a bootable ISO from your built image:

```bash
cd ../bootc-buildiso
```

**Important:** Before running the ISO build script, ensure the image version in `buildiso.sh` matches the version displayed by `podman images`.

```bash
./buildiso.sh
```

**Authentication Note:** You may need to authenticate with Red Hat's registry:

```bash
podman login registry.redhat.io
```

Enter your Red Hat credentials when prompted.

## Image Details

- **Base:** RHEL9
- **Security Profile:** SCAP-hardened configuration
- **Container Technology:** bootc (boot container)
- **Version:** v1.2

## Use Cases

- **Bare Metal Installation:** Deploy hardened RHEL9 systems on physical hardware
- **Virtual Machine Deployment:** Install in virtualized environments
- **Network Updates:** Maintain systems via containerized update distribution

## Troubleshooting

### Common Issues

**Build Failures:**
- Ensure Red Hat subscription is active
- Verify network connectivity to registry.redhat.io
- Check available disk space

**ISO Generation Problems:**
- Confirm image version matches in buildiso.sh
- Verify podman authentication status

## Security Considerations

This image incorporates SCAP (Security Content Automation Protocol) hardening profiles. Review the security configurations before deployment in production environments.

## Contributing

*[Contribution guidelines to be added]*

## License

*[License information to be added]*

## Support

*[Support contact information to be added]*

---

**Note:** This documentation is subject to updates and improvements. Check back for additional details and enhanced instructions.
