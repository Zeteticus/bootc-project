#sudo podman pull localhost:5000/rhel10-bootc-wks:latest
#
#sudo podman run --rm -it \
#    --privileged \
#    --pull=newer \
#    --security-opt label=type:unconfined_t \
#    -v $(pwd)/output:/output \
#    -v /var/lib/containers/storage:/var/lib/containers/storage \
#    quay.io/centos-bootc/bootc-image-builder:latest \
#    build \
#    --type iso \
#    localhost:5000/rhel10-bootc-wks:latest


sudo podman pull localhost:5000/rhel9-bootc-scapped-v1.1:latest

sudo podman run --rm -it \
	--privileged --security-opt label=type:unconfined_t \
	--authfile auth.json \
	-v /var/lib/containers/storage:/var/lib/containers/storage \
	-v "$(pwd)/output:/output" \
	-v ~/bootc-project/bootc-buildiso/config.toml:/config.toml quay.io/centos-bootc/bootc-image-builder \
	build \
	--type iso \
	--config /config.toml \
	localhost:5000/rhel9-bootc-scapped-v1.1:latest
