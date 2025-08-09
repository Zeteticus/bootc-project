# Start with HTTPS
podman run -d \
  --name production-registry \
  --replace \
  --authfile auth.json \
  --restart=always \
  -p 5000:5000 \
  -v ~/registry-data:/var/lib/registry:Z \
  -v ~/registry-certs:/certs:Z \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
  -e REGISTRY_STORAGE_DELETE_ENABLED=true \
  docker.io/library/registry:2
