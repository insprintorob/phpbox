#
# Cookbook Name:: restart-servers
# Recipe:: default
#
# Copyright 2013, Insprinto
#
# All rights reserved - Do Not Redistribute
#
execute "apachectl restart" do
  command "apachectl restart"
  action :run
end

