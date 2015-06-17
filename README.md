Vault Cookbook
==============
This Chef cookbook installs and configures  [Vault][4] by HashiCorp.


It requires a working [Consul][1] installation on the target node
(if the installation is local on Console-Server); add your consule cookbook to the node run_list.

For more details [Consul-cookbook][3]

------------

### Platform:

* 14.04LTS.


### Cookbooks:

* ark >= 0.9.0
* consul >= 0.9.1


Attributes
----------

#### vault::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['vault']['version']</tt></td>
    <td>String</td>
    <td>Version to install</td>
    <td><tt>0.1.2</tt></td>
  </tr>
  <tr>
    <td><tt>['vault']['download_url']</tt></td>
    <td>String</td>
    <td>URL for  downloads</td>
    <td><tt>https://dl.bintray.com/mitchellh/vault/</tt></td>
  </tr>
   <tr>
    <td><tt>['vault']['checksum']</tt></td>
    <td>String</td>
    <td>Chcecksum for vault downloaded file</td>
    <td><tt>defaults to the chosen version and Platform</tt></td>
  </tr>
  <tr>
    <td><tt>['vault']['install']['dir']</tt></td>
    <td>String</td>
    <td>Vault install dir</td>
    <td><tt>/usr/local</tt></td>
  </tr>
  <tr>
    <td><tt>['vault']['path']['logs']</tt></td>
    <td>String</td>
    <td>Vault logs dir</td>
    <td><tt>/usr/local/var/log/vault</tt></td>
  </tr>
  <tr>
    <td><tt>['vault']['path']['conf']</tt></td>
    <td>String</td>
    <td>Vault Configuration dir</td>
    <td><tt>/usr/local/etc/vault</tt></td>
  </tr>
  <tr>
    <td><tt>['vault']['listener']['port']</tt></td>
    <td>String</td>
    <td>Listener port for Api Request</td>
    <td><tt>8230</tt></td>
  </tr>
  <tr>
    <td><tt>['vault']['backend']['port']</tt></td>
    <td>String</td>
    <td>Backend storage port for Vault</td>
    <td><tt>8500</tt></td>
  </tr>
</table>


Usage
-----
#### vault::default
Just include `vault` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[vault]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Commit your changes.
4. Submit a Pull Request using Github

License and Authors
-------------------
- Author: [CostyaRegev][3] (<Costya.regev@me.com>)

[1]: http://consul.io
[2]: https://github.com/johnbellone/consul-cookbook
[3]: https://github.com/CostyaRegev
[4]: https://vaultproject.io/
