#!/usr/bin/env sh
set -eu

if [ -z "${DOMAIN:-}" ] || [ -z "${EMAIL:-}" ]; then
  echo "Missing DOMAIN or EMAIL env var."
  echo "Example: DOMAIN=example.com EMAIL=you@example.com ./ops/init-letsencrypt.sh"
  exit 1
fi

echo "Starting nginx on port 80 for ACME challenge..."
docker compose up -d nginx

echo "Requesting Let's Encrypt certificate for ${DOMAIN}..."
docker compose run --rm certbot certonly \
  --webroot \
  -w /var/www/certbot \
  -d "$DOMAIN" \
  --email "$EMAIL" \
  --agree-tos \
  --no-eff-email

echo "Reloading nginx..."
docker compose exec nginx nginx -s reload

echo "Done. You can now run: docker compose up -d --build"

