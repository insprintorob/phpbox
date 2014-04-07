#
# Cookbook Name:: devbox
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

cookbook_file "/etc/apache2/sites-available/default.conf" do
  source "default.conf"
  mode "0644"
end
