#
# Cookbook Name:: devbox
# Recipe:: default
#
# Copyright 2014, Insprinto
#
# All rights reserved - Do Not Redistribute
#

#Packages Installation
package "apache2" do
  action :upgrade 
end

package "php5" do
  action :upgrade 
end

package "php5-xdebug" do
  action :upgrade 
end

package "php5-cli" do
  action :upgrade 
end

package "php5-json" do
  action :upgrade
end

package "mysql-server" do
  action :upgrade
end

package "git" do
  action :upgrade 
end

package "vim" do
  action :upgrade 
end

package "phpmyadmin" do
  action :upgrade
end

#PHP Configuration

cookbook_file "/etc/php5/apache2/php.ini" do
  source "php.ini"
  mode "0644"
end

#PHPMyAdmin
cookbook_file "/etc/phpmyadmin/config.inc.php" do
  source "config.inc.php"
  mode "0644"
end

#Apache Configuration
cookbook_file "/etc/apache2/apache2.conf" do
  source "apache2.conf"
  mode "0644"
end

execute "enable apache2 mod_rewrite" do
  command "ln -fs /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load"
  action :run
end

execute "apachectl restart" do
  command "apachectl restart"
  action :run
end
