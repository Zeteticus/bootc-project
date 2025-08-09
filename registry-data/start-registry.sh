# Start with HTTPS
podman run -d \
  --replace \
  --name myregistry \
  --authfile auth.json \
  --restart=always \
  -p 5000:5000 \
  -v ~/bootc-project/registry-data:/var/lib/registry:Z \
  -v ~/bootc-project/registry-certs:/certs:Z \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
  -e REGISTRY_STORAGE_DELETE_ENABLED=true \
  docker.io/library/registry:2
