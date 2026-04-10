## Nginx + HTTPS (Let's Encrypt) cho EC2

### Prerequisites

- DNS `A record` trỏ domain về public IP của EC2
- Security Group mở inbound `80` và `443`
- Trên EC2 có `docker` và `docker compose` (compose plugin)

### Lần đầu lấy chứng chỉ

SSH vào EC2, trong thư mục repo (`/home/ubuntu/begin`) chạy:

```bash
chmod +x ./ops/init-letsencrypt.sh
DOMAIN=your-domain.com EMAIL=you@example.com ./ops/init-letsencrypt.sh
docker compose up -d --build
```

### Gia hạn chứng chỉ

Chạy định kỳ (cron) trên EC2:

```bash
docker compose run --rm certbot renew
docker compose exec nginx nginx -s reload
```

