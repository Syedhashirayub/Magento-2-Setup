# Magento-2-Setup

# ✅ Magento 2 Setup Assignment Submission

## 🔧 Server Details
- **Provider:** AWS EC2
- **OS:** Debian GNU/Linux 12 (bookworm)
- **Kernel:** 6.1.0-32-cloud-amd64
- **Public IP:** `YOUR_PUBLIC_IP_HERE`

## 🌐 Domains Configured
- ✅ Magento: https://test.mgt.com
- ✅ PhpMyAdmin: https://pma.mgt.com

> Both entries added to `/etc/hosts` on local machine and server.

---

## 📦 Installed Components

| Component     | Version | Configured |
|---------------|---------|------------|
| PHP           | 8.3     | ✅ Yes |
| MySQL         | 8       | ✅ Yes |
| NGINX         | 1.22.1  | ✅ Yes |
| Elasticsearch | 8.x     | ✅ Yes |
| Redis         | 6.x     | ✅ Yes |
| Magento       | 2.x     | ✅ Installed via Composer |
| phpMyAdmin    | Latest  | ✅ Yes |
| Varnish       | 7.1     | ✅ Configured |

---

## ⚙️ Configuration Summary

- Magento installed at `/var/www/test.mgt.com`
- Sample Data installed ✅
- Magento connected to:
  - Elasticsearch (for catalog search)
  - Redis (for **cache** and **session** storage)
- NGINX runs as user: `test-ssh`
- PHP-FPM pool also runs as `test-ssh:clp`
- HTTPS enforced with self-signed SSL certificate
- HTTP automatically redirects to HTTPS ✅
- Varnish listens on port `80`, NGINX listens on `8080`

---

## 🛠 Key Configuration Files (Included in zip)
- `/etc/nginx/sites-available/test.mgt.com`
- `/etc/php/8.3/fpm/pool.d/test-ssh.conf`
- `/etc/varnish/default.vcl`
- `/etc/hosts`
- `env.php` (passwords redacted)

---

## 📸 Screenshots / Logs
- Magento Homepage (✅ working)
- phpMyAdmin Login Page (✅ working)
- `curl -I` response for both domains showing `200 OK`
- `systemctl status` for Redis, PHP-FPM, MySQL, Elasticsearch
- `openssl x509 -in <crt> -noout -dates` (to confirm cert validity)

---

## 🧪 Verification Commands

```bash
php -v
mysql --version
nginx -v
curl -I https://test.mgt.com --insecure
curl -I https://pma.mgt.com --insecure
ps aux | grep php-fpm
systemctl status varnish
