#!/usr/bin/env bash
amazon-linux-extras install -y nginx1.12
echo "hello world" > /usr/share/nginx/html/index.html
systemctl restart nginx
