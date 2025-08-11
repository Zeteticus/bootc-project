# Run without TLS
podman run -d \
  --restart=always \
  -p 5000:5000 \
  -v ~/bootc-project/registry-data:/var/lib/registry:Z \
  -e REGISTRY_STORAGE_DELETE_ENABLED=true \
  docker.io/library/registry:2
