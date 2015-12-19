server {
    listen 80;

    server_name {{ nginx.server_name }};
    root        {{ nginx.doc_root }};

    error_log   {{ nginx.log_directory }}/error.log;
    access_log  {{ nginx.log_directory }}/access.log;

    location / {
        try_files $uri /app.php$is_args$args;
    }

    # DEV
    location ~ ^/(app_dev|config)\.php(/|$) {
        fastcgi_pass            unix:/var/run/php5-fpm.sock;
        fastcgi_buffer_size     16k;
        fastcgi_buffers         4 16k;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include                 fastcgi_params;
        fastcgi_param           SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param           HTTPS           off;
    }

    # PROD
    location ~ ^/app\.php(/|$) {
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;
        fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
        internal;
    }
}

