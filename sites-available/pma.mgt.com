#server {
#   listen 80;
#    server_name pma.mgt.com;
#    return 301 https://$host$request_uri;
#}

server {
    listen 443 ssl;
    server_name pma.mgt.com;

    ssl_certificate /etc/nginx/ssl/pma.mgt.com/pma.mgt.com.crt;
    ssl_certificate_key /etc/nginx/ssl/pma.mgt.com/pma.mgt.com.key;

    root /usr/share/phpmyadmin;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.3-fpm-test-ssh.sock;
	fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location ~ /\.ht {
        deny all;
    }
}

