nginx:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: nginx
      {% for server in salt['pillar.get']('rails_data:servers') %}
      - file: /etc/nginx/sites-available/{{ server.name }}
      {% endfor %}

{% for server in salt['pillar.get']('rails_data:servers') %}
/etc/nginx/sites-available/{{ server.name }}:
  file.managed:
    - source: salt://files/nginx/{{ server.name }}
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-enabled/{{ server.name }}:
  file.symlink:
    - target: /etc/nginx/sites-available/{{ server.name }}
    - require:
      - file: /etc/nginx/sites-available/{{ server.name }}
{% endfor %}

### SRV

/srv/www:
  file.directory:
    - user: {{ salt['pillar.get']('rails_data:user') }}
    - group: {{ salt['pillar.get']('rails_data:user') }}
    - mode: 755
    - makedirs: True


/srv/www/onewebstory.com/shared/config/secrets.yml:
  file.managed:
    - source: salt://files/srv/exampleone.secrets.yml
    - user: {{ salt['pillar.get']('rails_data:user') }}
    - group: {{ salt['pillar.get']('rails_data:user') }}
    - mode: 644
    - makedirs: True
