name             'vault'
maintainer       'Costya.Regev'
maintainer_email 'Costya.regev@me.com'
license          'All rights reserved'
description      'Installs/Configures vault'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'



%w( ubuntu ).each do |os|
  supports os
end

recipe 'vault::default', 'Installs and configures vault server'


depends 'ark'
  