server {
    listen 8080;
    server_name test.mgt.com;

    set $MAGE_ROOT /var/www/test.mgt.com;
    include /var/www/test.mgt.com/nginx.conf.sample;
}

server {
    listen 443 ssl;
    server_name test.mgt.com;

    ssl_certificate /etc/nginx/ssl/test.mgt.com/test.mgt.com.crt;
    ssl_certificate_key /etc/nginx/ssl/test.mgt.com/test.mgt.com.key;

    set $MAGE_ROOT /var/www/test.mgt.com;
    include /var/www/test.mgt.com/nginx.conf.sample;

    fastcgi_param  HTTPS on;
}

