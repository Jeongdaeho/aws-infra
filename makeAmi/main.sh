# 시간대 변경
timedatectl set-timezone Asia/Seoul

# yum update
sudo yum -y update

# php, nginx, git 설치
sudo amazon-linux-extras install -y nginx1 php8.0
sudo yum install -y git php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip}
# nginx 시작 프로그램 등록.
sudo systemctl enable nginx
sudo service nginx start
# php-fpm 설정. php-fpm 실행 권한이 변경된다.
sudo sed -i 's|;*user = apache|user = nginx|g' /etc/php-fpm.d/www.conf
sudo sed -i 's|;*group = apache|group = nginx|g' /etc/php-fpm.d/www.conf

#시작 프로그램 등록
sudo systemctl enable php-fpm
sudo service php-fpm restarsudo service php-fpm restartt

# php.ini 설정변경 ( 기본 설정이 다를 수 있으니 확인이 필요하다.)
# configure php
sudo sed -i 's|;*post_max_size = 8M|post_max_size = 50M|g' /etc/php.ini
sudo sed -i 's|;*upload_max_filesize = 2M|upload_max_filesize = 10M|g' /etc/php.ini

# Back up nginx config
sudo mv /etc/nginx/nginx.conf /etc/nginx-backup/nginx.conf

# nginx.conf 파일 내려 받기 
sudo wget -O /etc/nginx/nginx.conf https://raw.githubusercontent.com/Jeongdaeho/aws-infra/main/makeAmi/nginx.ini

sudo service nginx start

# composer 설치
cd /home/ec2-user
sudo curl -sS https://getcomposer.org/installer | php 
sudo mv composer.phar /usr/local/bin/composer
sudo ln -s /usr/local/bin/composer /usr/bin/composer

#laravel 설치
composer global require laravel/installer

# 소스 내려받기
# git clone https://id:password@github.com/mycompany/ExampleServer.git www

# 권한 변경
# https://stackoverflow.com/questions/30639174/how-to-set-up-file-permissions-for-laravel
# 디렉 토리 권한 변경
sudo chmod 711 /home/ec2-user
# group 권한 추가
sudo usermod -a -G nginx ec2-user
# 모든 파일 ower, group 지정.
sudo chown -R ec2-user:nginx /home/ec2-user/www

# 모든 파일 permission 지정
sudo find /home/ec2-user/www -type f -exec chmod 644 {} \; 
sudo find /home/ec2-user/www -type d -exec chmod 755 {} \;

sudo chmod -R ug+rwx storage bootstrap/cache





