#!/bin/bash

sudo podman pull localhost:5000/rhel9-bootc-scapped-v1.4

sudo podman run --rm -it \
	--privileged --security-opt label=type:unconfined_t \
	-v /var/lib/containers/storage:/var/lib/containers/storage \
	-v "$(pwd)/output:/output" \
	-v ~/bootc-project/bootc-buildiso/config.toml:/config.toml registry.redhat.io/rhel9/bootc-image-builder \
	--type iso \
	--config /config.toml \
	localhost:5000/rhel9-bootc-scapped-v1.3
