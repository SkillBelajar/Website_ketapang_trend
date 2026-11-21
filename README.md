# Website_ketapang_trend (detikKetapang)

[![Nginx FastCGI RAM Cache](https://img.shields.io/badge/FastCGI%20Cache-tmpfs%20RAM-blue.svg)](#)
[![WordPress](https://img.shields.io/badge/WordPress-FPM%20Alpine-green.svg)](#)
[![Redis](https://img.shields.io/badge/Redis-Object%20Cache-red.svg)](#)
[![Throughput](https://img.shields.io/badge/Stress%20Tested-6%2C400%2B%20RPS-orange.svg)](#)
[![License](https://img.shields.io/badge/License-GPLv2-lightgrey.svg)](#)

High-Performance WordPress Docker Stack dengan arsitektur **Zero Disk I/O RAM Cache (tmpfs 256M)**, MariaDB 10.11, Redis Object Cache (Predis), PHP-FPM On-Demand, dan tema kustom berita editorial bergaya **detik.com** (`detik-ketapang`).

Telah diuji stres (*stress test*) menggunakan Grafana k6 menangani **1.000 concurrent users** selama 60 detik dengan hasil **6.400+ RPS (total 384.381 requests, 0 error 5xx, p95 latency 251ms)**.

---

## 🚀 Fitur Utama & Arsitektur

1. **Nginx FastCGI RAM Cache (`tmpfs`)**:
   - Cache halaman HTML publik disimpan langsung di RAM (`/var/cache/nginx/fastcgi`), ukuran `256M`.
   - Menggunakan mekanisme **anti-stampede** (`fastcgi_cache_lock on`, `fastcgi_cache_use_stale`) sehingga aman diserbu ribuan pengunjung bersamaan.
   - Header debug `X-FastCGI-Cache: HIT / MISS / BYPASS`.
2. **PHP-FPM On-Demand**:
   - `pm = ondemand`, `pm.max_children = 20`, `memory_limit = 128M`.
   - RAM di-reclaim otomatis saat idle, hemat memori (~50-80 MiB idle).
3. **Redis Object Cache**:
   - Database queries dan transients tersimpan di memori in-memory Redis (`allkeys-lru`).
4. **Cloudflare Tunnel Ready**:
   - Dukungan SSL/HTTPS tanpa reverse proxy loop melalui deteksi `HTTP_X_FORWARDED_PROTO`.
   - Siap dijalankan via Docker profile `tunnel` atau CLI host.
5. **Tema Kustom `detik-ketapang`**:
   - Layout 65:35 khas portal berita nasional (Hero Spotlight, 3 Sub-headlines, Kilas Berita).
   - Ticker berita berjalan (`● TERKINI`), Trending Hashtag bar, Billboard Iklan Layanan Masyarakat.
   - Widget **TERPOPULER** podium (peringkat 1, 2, 3 berangka **Orange tebal**, 4 & 5 abu-abu).
   - Widget **Pasar & Komoditas Kalbar** (Sawit TBS, CPO, Karet, Bauksit, Beras).

---

## ⚡ Panduan Cepat (Clone & Run dalam 1 Menit)

### 1. Clone Repositori
```bash
git clone https://github.com/SkillBelajar/Website_ketapang_trend.git
cd Website_ketapang_trend
```

### 2. Jalankan Script Setup Otomatis
```bash
./setup.sh
```
Script ini akan secara otomatis:
- Menyalin konfigurasi default dari `.env.example` ke `.env` (jika belum ada).
- Menyalakan container (`mariadb`, `redis`, `wordpress`, `nginx`).
- Menunggu seluruh container siap dan berstatus `healthy`.
- Menyinkronkan tema `detik-ketapang`, plugin `redis-cache`, uploads, dan drop-in cache.
- Mengimpor database awal dari `database/init.sql`.
- Mengaktifkan tema, Redis cache, dan membersihkan FastCGI cache.

---

## ⚙️ Variabel Lingkungan (`.env`)

| Variabel | Deskripsi | Default Contoh |
| :--- | :--- | :--- |
| `APP_PORT` | Port host lokal yang diekspos Nginx | `8084` |
| `DB_NAME` | Nama database MySQL/MariaDB | `wordpress` |
| `DB_USER` | Username database | `wpuser` |
| `DB_PASSWORD` | Password database | *(dihasilkan acak)* |
| `DB_ROOT_PASSWORD` | Password root MariaDB | *(dihasilkan acak)* |
| `CLOUDFLARE_TUNNEL_TOKEN` | Token Cloudflare Zero Trust (opsional) | *(kosong jika lokal)* |

---

## 🌐 Menghubungkan ke Domain / Cloudflare Tunnel

Jika menggunakan domain publik (misalnya `https://ketapang.pawandigital.id`):

### 1. Update Domain di Database WordPress
Gunakan WP-CLI dari host:
```bash
docker run --rm \
  --network wp-prod-stack_wp-net \
  -e WORDPRESS_DB_HOST=mariadb:3306 \
  -e WORDPRESS_DB_NAME=wordpress \
  -e WORDPRESS_DB_USER=wpuser \
  -e WORDPRESS_DB_PASSWORD=<password_db> \
  -e "WORDPRESS_CONFIG_EXTRA=define('WP_REDIS_HOST', 'redis'); define('WP_REDIS_PORT', 6379);" \
  -v wp-prod-stack_wp_data:/var/www/html \
  wordpress:cli wp search-replace "http://127.0.0.1:8084" "https://domain-anda.com"
```

### 2. Flush Cache
```bash
# Flush Redis Object Cache
docker run --rm --network wp-prod-stack_wp-net \
  -e WORDPRESS_DB_HOST=mariadb:3306 -e WORDPRESS_DB_NAME=wordpress \
  -e WORDPRESS_DB_USER=wpuser -e WORDPRESS_DB_PASSWORD=<password_db> \
  -e "WORDPRESS_CONFIG_EXTRA=define('WP_REDIS_HOST', 'redis'); define('WP_REDIS_PORT', 6379);" \
  -v wp-prod-stack_wp_data:/var/www/html wordpress:cli wp cache flush

# Flush Nginx FastCGI RAM Cache
docker compose exec nginx sh -c "rm -rf /var/cache/nginx/fastcgi/*"
```

### 3. Aktifkan Cloudflare Tunnel
Isi `CLOUDFLARE_TUNNEL_TOKEN` pada file `.env`, lalu jalankan:
```bash
docker compose --profile tunnel up -d cloudflared
```
Pada Cloudflare Zero Trust Dashboard, arahkan Public Hostname ke Service URL: `http://nginx:80`.

---

## 🤖 Panduan untuk AI Agent & Automated Pipelines

1. **Menjalankan WP-CLI**:
   Selalu sertakan variabel `-e WORDPRESS_CONFIG_EXTRA="define('WP_REDIS_HOST', 'redis'); define('WP_REDIS_PORT', 6379);"` agar drop-in Redis tidak mencoba konek ke `127.0.0.1`.
2. **Membersihkan Cache Nginx**:
   `docker compose exec nginx sh -c "rm -rf /var/cache/nginx/fastcgi/*"`
3. **Backup Database Terkini**:
   `docker exec wp_mariadb mariadb-dump -u wpuser -p<password> wordpress > database/init.sql`
4. **Proteksi Keamanan Aktif**:
   - `/xmlrpc.php` diblokir otomatis oleh Nginx (`403 Forbidden`).
   - File tersembunyi `.*` ditolak aksesnya.
   - Resource limits (memory) aktif di semua container untuk mencegah OOM.

---

## 📊 Hasil Pengujian Beban (Stress Test 1.000 VUs)

```text
✓ checks .................................: 100.00% 384381 out of 384381
✓ http_req_duration ......................: avg=127.38ms  p(90)=212.55ms  p(95)=251.28ms  max=780.84ms
✓ http_req_failed ........................: 0.00%   0 out of 384381
✓ http_reqs ..............................: 384381  6400.46/s
✓ vus ....................................: 1000
```
Stack memproses **6.400+ request per detik** dengan rata-rata total RAM seluruh container hanya berkisar **~160-200 MiB**.
