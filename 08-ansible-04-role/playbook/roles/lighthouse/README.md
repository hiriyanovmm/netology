# lighthouse-role

Ansible role for installing and configuring [LightHouse](https://github.com/VKCOM/lighthouse) with NGINX on EL-based systems.

## Requirements

- Ansible 2.12 or newer
- EL 8/EL 9 compatible host
- Internet access to download NGINX packages and LightHouse archive

## Role Variables

Variables from `defaults/main.yml`:

| Variable | Default value | Description |
|---|---|---|
| `lighthouse_nginx_repo_name` | `nginx-stable` | Name of the NGINX repository. |
| `lighthouse_nginx_repo_description` | `nginx stable repo` | Human-readable repository description. |
| `lighthouse_nginx_repo_baseurl` | `https://nginx.org/packages/centos/$releasever/$basearch/` | Base URL of the NGINX repository. |
| `lighthouse_nginx_repo_gpgkey` | `https://nginx.org/keys/nginx_signing.key` | GPG key for the NGINX repository. |
| `lighthouse_install_dir` | `/usr/share/nginx/html/lighthouse` | Target directory where LightHouse static files are installed. |
| `lighthouse_archive_url` | `https://github.com/VKCOM/lighthouse/archive/refs/heads/master.zip` | URL of the LightHouse archive. |
| `lighthouse_archive_path` | `/tmp/lighthouse.zip` | Temporary path for the downloaded archive. |
| `lighthouse_unpack_dir` | `/tmp/lighthouse-src` | Temporary directory used to unpack the archive. |
| `lighthouse_nginx_conf_path` | `/etc/nginx/conf.d/lighthouse.conf` | Path to the NGINX virtual host configuration file. |

## What the role does

The role performs the following actions:

- adds the official NGINX repository;
- refreshes package cache;
- installs `nginx` and `unzip`;
- creates directories for LightHouse installation and archive extraction;
- downloads the LightHouse archive;
- unpacks project files;
- copies static files to the target web directory;
- deploys the NGINX configuration from template;
- starts and enables the NGINX service.

## Templates

This role uses the following template:

- `templates/lighthouse.conf.j2` — NGINX server configuration for serving LightHouse.

## Dependencies

This role has no external role dependencies.

## Example Playbook

```yaml
- hosts: lighthouse
  roles:
    - role: lighthouse
```

Example with custom variables:

```yaml
- hosts: lighthouse
  roles:
    - role: lighthouse
      vars:
        lighthouse_install_dir: /var/www/lighthouse
        lighthouse_nginx_conf_path: /etc/nginx/conf.d/lighthouse.conf
```

## Tags

Available tag:

- `lighthouse`

## License

MIT

## Author Information

Maksim Hiriyanov