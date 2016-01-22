mysql-server:
  pkg.installed

MySQL user:
  mysql_user.present:
    - name: {{ salt['pillar.get']('rails_data:user') }}
    - host: localhost
    - password: {{ salt['pillar.get']('rails_data:mysql:password') }}
    - connection_charset: utf8
    - require:
      - pkg: mysql-server

ruby-mysql-deps:
  pkg.installed:
    - pkgs:
      - libmysqlclient-dev


{% for server in salt['pillar.get']('rails_data:servers') %}
db-{{ server.db }}:
  mysql_database.present:
    - name: {{ server.db }}
  mysql_grants.present:
    - grant: all privileges
    - database: {{ server.db }}.*
    - user: {{ salt['pillar.get']('rails_data:user') }}
{% endfor %}
