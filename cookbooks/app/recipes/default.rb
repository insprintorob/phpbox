#
# Cookbook Name:: app 
# Recipe:: default
#
# Copyright 2013, Insprinto
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "/etc/hostname" do
  source "hostname"
  mode "0644"
end

cookbook_file "/etc/hosts" do
  source "hostname"
  mode "0644"
end

template "/etc/apache2/sites-available/000-default.conf" do
  source "default.conf.erb"
  owner "root"
  group "root"
  mode 0644
end
