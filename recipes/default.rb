#
# Cookbook Name:: vault
# Recipe:: default
#
# Copyright 2015, Totango
#
# All rights reserved - Do Not Redistribute
include_recipe "vault::service"
include_recipe "vault::install"



# [Create Vault directories]
[ node.vault[:conf_dir], node.vault[:logs_dir] ].each do |path|
  directory path do
    owner node.vault[:user] and group node.vault[:user] and mode 0755
    recursive true
    action :create
  end
end

directory node.vault[:pid_path] do
  mode '0755'
  recursive true
end


