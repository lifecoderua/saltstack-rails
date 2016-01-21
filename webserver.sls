nginx:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/sites-available/exampleone

/etc/nginx/sites-available/exampleone:
  file.managed:
    - source: salt://files/nginx/exampleone
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-enabled/exampleone:
  file.symlink:
    - target: /etc/nginx/sites-available/exampleone
    - require:
      - file: /etc/nginx/sites-available/exampleone


/etc/nginx/sites-available/exampletwo:
  file.managed:
    - source: salt://files/nginx/exampletwo
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-enabled/exampletwo:
  file.symlink:
    - target: /etc/nginx/sites-available/exampletwo
    - require:
      - file: /etc/nginx/sites-available/exampletwo



/etc/nginx/sites-available/examplethree:
  file.managed:
    - source: salt://files/nginx/examplethree
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-enabled/examplethree:
  file.symlink:
    - target: /etc/nginx/sites-available/examplethree
    - require:
      - file: /etc/nginx/sites-available/examplethree

### SRV

/srv/www:
  file.directory:
    - user: deploy
    - group: deploy
    - mode: 755
    - makedirs: True


/srv/www/onewebstory.com/shared/config/secrets.yml:
  file.managed:
    - source: salt://files/srv/exampleone.secrets.yml
    - user: deploy
    - group: deploy
    - mode: 644
    - makedirs: True
