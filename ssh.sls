ssh_key_access:
  ssh_auth.present:
    - user: {{ salt['pillar.get']('rails_data:user') }}
    - name: {{ salt['pillar.get']('rails_data:ssh_public_key') }}
