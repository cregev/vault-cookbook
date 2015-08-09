#
# Cookbook Name:: vault
# [Recipe:: install]
#
# Copyright 2015, Costya.Regev@me.com
#
# All rights reserved - Do Not Redistributeinclude_recipe "ark"

# [Create user and group]
group node.vault[:user] do
  gid node.vault[:gid]
  action :create
  system true
end

user node.vault[:user] do
  comment "vault user"
  home    "#{node.vault[:install_dir]}/vault"
  shell   "/bin/bash"
  uid     node.vault[:uid]
  gid     node.vault[:user]
  supports :manage_home => false
  action  :create
  system true
end

# [Root limits]
bash "enable user limits" do
  user 'root'

  code <<-END.gsub(/^    /, '')
    echo 'session    required   pam_limits.so' >> /etc/pam.d/su
  END

  not_if { ::File.read("/etc/pam.d/su").match(/^session    required   pam_limits\.so/) }
end

# [Vault user limits]
file "/etc/security/limits.d/10-vault.conf" do
  content <<-END.gsub(/^    /, '')
    #{node.vault.fetch(:user, "vault")}     -    nofile    #{node.vault[:limits][:nofile]}
    #{node.vault.fetch(:user, "vault")}     -    memlock   #{node.vault[:limits][:memlock]}
  END
end


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


