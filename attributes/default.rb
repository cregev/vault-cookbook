#[Init]
#------
node.default[:vault] ||= {}
# [Version]
default.vault[:version] 	 = "0.1.2"
default.vault[:base_url] 	 = "https://dl.bintray.com/mitchellh/vault/"

#[Users & Groups]
#----------------
default.vault[:user]         = "vault"
default.vault[:uid]          = nil
default.vault[:gid]          = nil

#[Paths]
#-------
default.vault[:install_dir]     = "/usr/local"
default.vault[:logs_dir] 		= "/usr/local/var/log/vault"
default.vault[:conf_dir] 		= "/usr/local/etc/vault"

#[Process]
#---------
default.vault[:pid_path]  = "/usr/local/var/run"
default.vault[:pid_file]  = "#{node.vault[:pid_path]}/vault.pid"

#[Ports]
#-------
default.vault[:listener][:port] 	= 8230
default.vault[:backend][:port] 		= 8500

#[Configuration]
#---------------
default.vault[:backend][:address] = "127.0.0.1"
default.vault[:listener][:address] = "127.0.0.1"

#[Templates]
#-----------
default.vault[:templates][:config] 	= "config.hcl.erb"

#[LIMITS]
#--------
# By default, the `mlockall` is set to true: on weak machines and Vagrant boxes,
# you may want to disable it.
default.vault[:bootstrap][:mlockall] = ( node.memory.total.to_i >= 1048576 ? true : false )
default.vault[:limits][:memlock] = 'unlimited'
default.vault[:limits][:nofile]  = '64000'