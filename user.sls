{{ salt['pillar.get']('rails_data:user') }}:
  group.present: []
  user.present:
    - gid: {{ salt['pillar.get']('rails_data:user') }}
    - home: /home/{{ salt['pillar.get']('rails_data:user') }}
    - groups:
      - sudo
      - {{ salt['pillar.get']('rails_data:user') }}
