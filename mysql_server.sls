mysql-server:
  pkg.installed

MySQL user:
  mysql_user.present:
    - name: deploy
    - host: localhost
    - password: SomeCoolPassword
    - connection_charset: utf8
    - require:
      - pkg: mysql-server

ruby-mysql-deps:
  pkg.installed:
    - pkgs:
      - libmysqlclient-dev

db-exampleone:
  mysql_database.present:
    - name: exampleone
  mysql_grants.present:
    - grant: all privileges
    - database: exampleone.*
    - user: deploy

db-exampletwo:
  mysql_database.present:
    - name: exampletwo
  mysql_grants.present:
    - grant: all privileges
    - database: exampletwo.*
    - user: deploy

db-examplethree:
  mysql_database.present:
    - name: examplethree
  mysql_grants.present:
    - grant: all privileges
    - database: examplethree.*
    - user: deploy
