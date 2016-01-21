ssh_key_access:
  ssh_auth.present:
    - user: deploy
    - source: salt://files/authorized_keys
    - config: /home/deploy/.ssh/authorized_keys
