# Sendy Debian Server Playbook

This is an Ansible playbook that configures a Debian server to serve an
instance of Sendy.

Install ansible & run the playbook:

    sudo pip install ansible
    ansible-playbook sendy.yml --ask-sudo-pass

To edit secrets:

    ansible-vault edit group_vars/all/vault.yml

## Misc

* Edit details in `group_vars/all/vars.yml`
* Put your SSL cert & key at `/etc/ssl/private/sendy.{crt,key}`
* Add the SPF TXT record at `/etc/opendkim/keys/201606.txt` to your DNS.

## License

GPLv3
