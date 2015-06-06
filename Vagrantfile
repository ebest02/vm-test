# -*- mode: ruby -*-
# vi: set ft=ruby :

$preseed= <<SCRIPT
export DEBIAN_FRONTEND=noninteractive

echo "Pre-install nginx php mysql"
apt-get update
apt-get install -y  php5-fpm php5-cli nginx mysql-server php5-mysql curl

echo "Pre-install Node, Bower, Grunt"
test -x /usr/local/bin/node || {
  cd /usr/local/src
  wget --quiet http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz
  tar -zxvf node-v0.10.28-linux-x64.tar.gz
  cd /usr/local/bin
  ln -s /usr/local/src/node-v0.10.28-linux-x64/bin/node
  ln -s /usr/local/src/node-v0.10.28-linux-x64/bin/npm
  npm install -g bower grunt-cli grunt uglify-js uglifycss
} &>/dev/null

echo "Pre-install git"
apt-get install -y git &>/dev/null

echo "Setup project directory"
test -d /var/www/bonzaidigital-test-recrutement || {
  sudo mkdir -p /var/www/bonzaidigital-test-recrutement
  cd /var/www/bonzaidigital-test-recrutement
  git clone https://github.com/ebest02/test.git
  cp -rvp /var/www/bonzaidigital-test-recrutement/test/test/* /var/www/bonzaidigital-test-recrutement
  chown -R vagrant.vagrant /var/www/bonzaidigital-test-recrutement
} &>/dev/null

echo "Pre-install composer"
test -x /usr/local/bin/composer || {
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/opt
  sudo ln -s /opt/composer.phar /usr/local/bin/composer
}
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'precise64'
  config.vm.network 'forwarded_port', guest: 80, host: 8080
  config.vm.network 'forwarded_port', guest: 3306, host: 33060
  config.vm.provision :shell, :path => "install.sh"
  config.vm.provider 'virtualbox' do |v|
    v.memory = 4096
    v.cpus   = 2
  end
 
  config.ssh.forward_agent = true
 
  config.vm.provision :shell, inline: $preseed 
# Shell provisioning
    config.vm.provision "shell" do |s|
    	s.path = "install.sh"
    end
end
