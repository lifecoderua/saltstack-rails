/etc/init/puma.conf:
  file.managed:
    - template: jinja
    - source: salt://files/puma/etc/init/puma.conf
    - user: root
    - group: root
    - mode: 640

/etc/init/puma-manager.conf:
  file.managed:
    - source: salt://files/puma/etc/init/puma-manager.conf
    - user: root
    - group: root
    - mode: 640

/etc/puma.conf:
  file.managed:
    - template: jinja
    - source: salt://files/puma/etc/puma.conf
    - user: root
    - group: root
    - mode: 640
