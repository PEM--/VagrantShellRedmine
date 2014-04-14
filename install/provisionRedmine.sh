apt-get install -y language-pack-fr
cp /srv/hosts /etc/
cp /srv/hostname /etc/
add-apt-repository ppa:ondrej/redmine
apt-get update
apt-get -y upgrade
apt-get install -y apache2 libapache2-mod-passenger mysql-server mysql-client \
  ruby-rmagick redmine redmine-mysql git
cp /srv/database.yml /etc/redmine/default/database.yml
dpkg --configure -a
cp /srv/passenger.conf /etc/apache2/mods-available/passenger.conf
ln -s /usr/share/redmine/public /var/www/redmine
cp /srv/000-default.conf /etc/apache2/sites-available/000-default.conf
cp /srv/fqdn.conf /etc/apache2/conf-available/fqdn.conf
a2enconf fqdn.conf
service apache2 reload
chown -R www-data:www-data /usr/share/redmine
service apache2 restart
apt-get install -y php5-mcrypt phpmyadmin
cp /etc/php5/conf.d/mcrypt.ini /etc/php5/mods-available/
php5enmod mcrypt
service apache2 restart
gem install rack --version 1.4.5
cd /usr/share/redmine
sudo -u www-data rake db:migrate RAILS_ENV=production
sudo -u www-data rake redmine:plugins:migrate RAILS_ENV=production
sudo -u www-data rake tmp:cache:clear
sudo -u www-data rake tmp:sessions:clear
echo "gem 'rack', '1.4.5'" | tee -a /usr/share/redmine/Gemfile
service apache2 restart
cd /usr/share/redmine/public/themes
sudo -u www-data git clone git://github.com/pixel-cookers/redmine-theme.git
sudo -u www-data git clone http://github.com/MartinSenovsky/redmine-basecamp-theme-responsive.git
sudo -u www-data git clone https://github.com/themondays/redpenny.git
