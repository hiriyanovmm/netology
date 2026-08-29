# vector-role

Ansible role for installing and configuring [Vector](https://vector.dev/) on EL-based systems.

## Requirements

- Ansible 2.12 or newer
- EL 8/EL 9 compatible host
- Internet access to add the Vector repository and install the package

## Role Variables

Variables used by the role:

| Variable | Default value | Description |
|---|---|---|
| `vector_config_dir` | `/etc/vector` | Directory where Vector configuration is stored. |
| `vector_config_path` | `/etc/vector/vector.yaml` | Path to the main Vector configuration file. |
| `vector_source_log_path` | `/var/log/messages` | Source log file that Vector reads in the test configuration. |

## What the role does

The role performs the following actions:

- adds the official Vector repository;
- refreshes package cache;
- installs the `vector` package;
- creates the Vector configuration directory;
- deploys the configuration file from template;
- validates the configuration before applying it;
- starts and enables the Vector service.

## Templates

This role uses the following template:

- `templates/vector.yaml.j2` — Vector configuration in YAML format.

The default test configuration:

- reads logs from `{{ vector_source_log_path }}`;
- sends output to the `console` sink in JSON format.

## Dependencies

This role has no external role dependencies.

## Example Playbook

```yaml
- hosts: vector
  roles:
    - role: vector-role
```

Example with custom variables:

```yaml
- hosts: vector
  roles:
    - role: vector-role
      vars:
        vector_source_log_path: /var/log/messages
        vector_config_path: /etc/vector/vector.yaml
```

## Tags

Available tag:

- `vector`

## Validation

The role validates the configuration with:

```bash
/usr/bin/vector validate --config-yaml <config_file>
```

This helps prevent deployment of an invalid configuration.

## License

MIT

## Author Information

Maksim Hiriyanov