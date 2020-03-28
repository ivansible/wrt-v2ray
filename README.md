# ivansible.wrt_v2ray

[![Github Test Status](https://github.com/ivansible/wrt-v2ray/workflows/Molecule%20test/badge.svg?branch=master)](https://github.com/ivansible/wrt-v2ray/actions)
[![Travis Test Status](https://travis-ci.org/ivansible/wrt-v2ray.svg?branch=master)](https://travis-ci.org/ivansible/wrt-v2ray)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-ivansible.wrt__v2ray-68a.svg?style=flat)](https://galaxy.ansible.com/ivansible/wrt_v2ray/)

This role deploys [v2ray](https://github.com/v2ray/v2ray-core/) client
on Keenetic Entware.


## Requirements

None


## Variables

Main variables are listed below:

    wrt_v2ray_enable: true
Allows to install v2ray.
The role will be skipped if this flag is `false`.
You may want to disable v2ray since it's memory hungry.

    wrt_v2ray_domains: [example.com]
Connect to v2ray servers via websocket protocol located on the given list
of domains. If multiple domains are configured, they will be load-balanced.
The list can be nested, it will be flattened then.

    wrt_v2ray_web_port: 443
    wrt_v2ray_web_path: /
HTTP connection parameters, common for all domains.

    wrt_v2ray_uuid: aaa-111-222-333-4444
    wrt_v2ray_altids: 4
    wrt_v2ray_security: aes-128-gcm
Encryption parameters, common for all domains.
`uuid` is client id of _UUID_, `altids` gives the number of deterministic
alternative IDs in the range from 0 to 65535 (4 recommended).
The `security` method is one of: `aes-128-gcm` or `chacha20-poly1305`.

    wrt_v2ray_socks_addr: 127.0.0.1
    wrt_v2ray_socks_port: 21080
Set listening interface/port for incoming SOCKS proxy requests.
Use `0.0.0.0` as address to listen on all available interfaces.

    wrt_v2ray_http_proxy: false
    wrt_v2ray_http_addr: 127.0.0.1
    wrt_v2ray_http_port: 21081
Enables HTTP proxy support and sets listening address/port for incoming HTTP
proxy requests. Use `0.0.0.0` as address to listen on all interfaces.

    wrt_v2ray_client_upgrade: false
Enables upgrading of v2ray client binary.
By default it's not upgraded if already installed.

    wrt_v2ray_client_binary: /opt/usr/bin/v2ray-client
Path to install v2ray client binary.
The control program `v2ctl` will be installed in the same directory.

    wrt_v2ray_logging: false
Enables verbose logging under _/opt/var/log/v2ray_.


## Tags

- `wrt_v2ray_packages` -- install required packages
- `wrt_v2ray_v2ray` -- install v2ray client binaries
- `wrt_v2ray_privoxy` -- setup http proxy support
- `wrt_v2ray_config` -- update configuration
- `wrt_v2ray_service` -- enables v2ray service
- `wrt_v2ray_all` -- all tasks


## Dependencies

None


## Example Playbook

    - hosts: keenetic
      roles:
         - role: ivansible.wrt_v2ray
           wrt_v2ray_domains:
             - myserver.com
             - myserver.org
             - myserver.net
           wrt_v2ray_socks_port: 1080
           wrt_v2ray_socks_addr: 0.0.0.0
           wrt_v2ray_http_port: 8080


## License

MIT


## Author Information

Created in 2020 by [IvanSible](https://github.com/ivansible)
