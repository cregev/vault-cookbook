include_recipe "ark"

install_arch = node['kernel']['machine'] =~ /x86_64/ ? 'amd64' : '386'
install_version = ['vault', node['vault']['version'], node['os'], install_arch].join('_')
install_checksum = node['vault']['checksums'].fetch(install_version)

# [Install Vault]
 ark "vault" do
   url  ::URI.join(node['vault']['base_url'],"##{install_version}.zip").to_s
   version node.vault[:version]
   checksum install_checksum
   append_env_path true
   mode 0755
   strip_components 0 
   action :install
   owner node.vault[:user]
   group node.vault[:user]


   notifies :start,   'service[vault]'
   notifies :restart, 'service[vault]'
 end


# [Config file for Vault Server]
template "config.hcl" do
  path "#{node.vault[:conf_dir]}/config.hcl"
  source node.vault[:templates][:config]
  owner node.vault[:user] and group node.vault[:user] and mode 0755
  action [:create_if_missing]
  notifies :restart, 'service[vault]'
end
