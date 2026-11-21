#!/usr/bin/env bash
# ==============================================================================
# Setup & Restore Script: WordPress High-Performance Stack (detikKetapang)
# Digunakan untuk inisialisasi awal setelah git clone oleh Developer atau AI Agent.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

echo ">>> 1. Memeriksa file .env..."
if [ ! -f .env ]; then
    if [ -f .env.example ]; then
        echo "    Membuat .env dari .env.example..."
        cp .env.example .env
    else
        echo "ERROR: File .env dan .env.example tidak ditemukan!"
        exit 1
    fi
fi

# Load variables
set -a
# shellcheck disable=SC1091
source .env
set +a

echo ">>> 2. Menyalakan stack Docker Compose..."
docker compose up -d

echo ">>> 3. Menunggu container siap dan berstatus healthy..."
MAX_WAIT=90
ELAPSED=0
until [ "$(docker inspect -f '{{.State.Health.Status}}' wp_mariadb 2>/dev/null || true)" == "healthy" ] && \
      [ "$(docker inspect -f '{{.State.Health.Status}}' wp_redis 2>/dev/null || true)" == "healthy" ] && \
      [ "$(docker inspect -f '{{.State.Health.Status}}' wp_app 2>/dev/null || true)" == "healthy" ] && \
      [ "$(docker inspect -f '{{.State.Health.Status}}' wp_nginx 2>/dev/null || true)" == "healthy" ]; do
    if [ "$ELAPSED" -ge "$MAX_WAIT" ]; then
        echo "ERROR: Timeout menunggu container berstatus healthy."
        docker compose ps
        exit 1
    fi
    sleep 3
    ELAPSED=$((ELAPSED + 3))
    echo "    Menunggu service... (${ELAPSED}s / ${MAX_WAIT}s)"
done
echo "    Semua service berstatus healthy!"

echo ">>> 4. Sinkronisasi aset tema, plugin, uploads, dan drop-in..."
docker cp ./themes/detik-ketapang wp_app:/var/www/html/wp-content/themes/
if [ -d ./plugins/redis-cache ]; then
    docker cp ./plugins/redis-cache wp_app:/var/www/html/wp-content/plugins/
fi
if [ -f ./object-cache.php ]; then
    docker cp ./object-cache.php wp_app:/var/www/html/wp-content/object-cache.php
fi
if [ -d ./uploads ]; then
    docker cp ./uploads wp_app:/var/www/html/wp-content/
fi

# Perbaiki permission
docker exec -u 0:0 wp_app chown -R www-data:www-data /var/www/html/wp-content

echo ">>> 5. Cek instalasi database WordPress..."
WP_CLI_CMD=(
    docker run --rm
    --network wp-prod-stack_wp-net
    -e WORDPRESS_DB_HOST=mariadb:3306
    -e WORDPRESS_DB_NAME="${DB_NAME}"
    -e WORDPRESS_DB_USER="${DB_USER}"
    -e WORDPRESS_DB_PASSWORD="${DB_PASSWORD}"
    -e "WORDPRESS_CONFIG_EXTRA=define('WP_REDIS_HOST', 'redis'); define('WP_REDIS_PORT', 6379);"
    -v wp-prod-stack_wp_data:/var/www/html
    wordpress:cli
)

if ! "${WP_CLI_CMD[@]}" wp core is-installed >/dev/null 2>&1; then
    echo "    WordPress belum terinstall di database. Mengimpor database/init.sql..."
    if [ -f ./database/init.sql ]; then
        docker exec -i wp_mariadb mariadb -u "${DB_USER}" "-p${DB_PASSWORD}" "${DB_NAME}" < ./database/init.sql
        echo "    Database init.sql berhasil diimpor!"
    else
        echo "    WARNING: database/init.sql tidak ditemukan, silakan install lewat WP-CLI."
    fi
fi

echo ">>> 6. Aktivasi tema & Redis Object Cache..."
"${WP_CLI_CMD[@]}" wp theme activate detik-ketapang || true
"${WP_CLI_CMD[@]}" wp plugin activate redis-cache || true
"${WP_CLI_CMD[@]}" wp redis enable || true
"${WP_CLI_CMD[@]}" wp cache flush

echo ">>> 7. Membersihkan FastCGI RAM Cache Nginx..."
docker compose exec nginx sh -c "rm -rf /var/cache/nginx/fastcgi/*" || true

echo "=============================================================================="
echo " Stack Berhasil Disiapkan & Berjalan Normal!"
echo " Akses Lokal    : http://127.0.0.1:${APP_PORT}"
echo " Login WP Admin : http://127.0.0.1:${APP_PORT}/wp-admin/"
echo " User           : admin"
echo " Password       : (lihat kredensial pada .env atau setup log)"
echo "=============================================================================="
