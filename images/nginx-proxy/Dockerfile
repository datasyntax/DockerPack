FROM jwilder/nginx-proxy
RUN sed -iE "s/keepalive_timeout  65;/keepalive_timeout  65;\n\tproxy_read_timeout 600s;\n\tunderscores_in_headers on;\n\tclient_max_body_size 1000m;\n\tserver_tokens off;/" /etc/nginx/nginx.conf
