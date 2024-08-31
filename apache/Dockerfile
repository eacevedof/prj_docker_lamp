FROM httpd:2.4

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    -y jq vim wget unzip ca-certificates

# Enable required Apache modules
RUN sed -i '/LoadModule proxy_module/s/^#//g' /usr/local/apache2/conf/httpd.conf \
    && sed -i '/LoadModule proxy_fcgi_module/s/^#//g' /usr/local/apache2/conf/httpd.conf \
    && sed -i '/LoadModule rewrite_module/s/^#//g' /usr/local/apache2/conf/httpd.conf

# Copy virtual host files
COPY vhosts/*.conf /usr/local/apache2/conf/vhosts/
RUN echo "Include /usr/local/apache2/conf/vhosts/*.conf" >> /usr/local/apache2/conf/httpd.conf

RUN mv /root/.bashrc /root/.bashrc.bak
COPY ./.bashrc /root/.bashrc
