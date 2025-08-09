#!/bin/bash
podman run --rm -it \
	--privileged --security-opt label=type:unconfined_t \
	-v /var/lib/containers/storage:/var/lib/containers/storage \
	-v "$(pwd)/output:/output" \
	-v /root/bootc-buildiso/config.toml:/config.toml registry.redhat.io/rhel9/bootc-image-builder \
	--type iso \
	--config /config.toml \
	 localhost/rhel9-bootc-scapped-v1.1:latest
