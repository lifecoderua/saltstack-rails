{{ salt['pillar.get']('rails_data:user', 'deploy') }}:
  group.present: []
  user.present:
    - gid: {{ salt['pillar.get']('rails_data:user', 'deploy') }}
    - home: /home/{{ salt['pillar.get']('rails_data:user', 'deploy') }}
    - groups:
      - sudo
      - {{ salt['pillar.get']('rails_data:user', 'deploy') }}
