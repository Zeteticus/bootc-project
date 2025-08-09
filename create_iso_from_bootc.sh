podman run \
    --authfile auth.json \
    --rm \
    --privileged \
    --security-opt label=type:unconfined_t \
    -v "$(pwd)/iso-output:/output" \
    -v "$(pwd)/ks.cfg:/ks.cfg:ro" \
    -v /var/lib/containers/storage:/var/lib/containers/storage \
    quay.io/centos-bootc/bootc-image-builder:latest \
    --type iso \
    --rootfs xfs \
    localhost/rhel9-bootc-scapped
