# SaltStack Rails setup

This is a sample SaltStack provisioning configuration for Rails applications.

It deploys the following stack:

- Nginx (with domains setup)
- Puma (with `puma-manager` Upstart script)
- RVM
- Multiple Ruby versions and Gemsets
- Multiple applications (and secrets.yml)
- NodeJS runtime for assets precompile
- MySql (with user and DB setup)
- SSH authorized key for deploy user
- Swap partition setup

You don't have to change anything in order to test this setup.

**Important:** Be sure to modify structure or store your copy in a private repository in order to keep the keys and secrets safe.


## Quick start

``` bash
# install client
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh

# specify it is local
echo "file_client: local" >> /etc/salt/minion

# install git
sudo apt-get install -y git

# clone SaltStack configuration
sudo git clone https://github.com/lifecoderua/saltstack-rails.git /srv/salt

# apply states
sudo salt-call --local state.highstate
```

Congratulations, you are bundled!

## ToDo:
- provide Wiki with Puma config sample
- use Pillar for clean configs
