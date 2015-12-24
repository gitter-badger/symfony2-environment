server {
    charset utf-8;
    client_max_body_size 128M;

    listen 80; ## listen for ipv4

    server_name {{ nginx.server_name }};
    root        {{ nginx.doc_root }};
    index       index.php;

    error_log   {{ nginx.log_directory }}/error.log;
    access_log  {{ nginx.log_directory }}/access.log;

    location / {
        autoindex on;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
    }

    location ~ /\.(ht|svn|git) {
        deny all;
    }
}