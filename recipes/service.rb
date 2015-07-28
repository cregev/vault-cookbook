#
# Cookbook Name:: vault
# [Recipe:: service]
#
# Copyright 2015, Costya.Regev@me.com
#
# All rights reserved - Do Not Redistribute

# [Create Vault service]
case node['platform']
  when 'ubuntu'
    template "/etc/init.d/vault.conf" do
      source "vault.conf.erb"
      owner 'root' and mode 0755
    end
  when 'centos,debian,amazon,redhat'
    template "/etc/init.d/vault" do
      source "vault.init.erb"
      owner 'root' and mode 0755
    end
end

# [Vault Service supports]
service "vault" do
  supports :status => true, :restart => true , :start => true , :stop => true
  action [:enable, :start]
end



