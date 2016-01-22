fetch_keys:
  cmd.run:
    - name: gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    - user: {{ salt['pillar.get']('rails_data:user') }}
    - unless: gpg --list-keys | grep 4096R/D39DC0E3

rvm-deps:
  pkg.installed:
    - pkgs:
      - bash
      - coreutils
      - gzip
      - bzip2
      - gawk
      - sed
      - curl
      - git-core

mri-deps:
  pkg.installed:
    - pkgs:
      - build-essential
      - openssl
      - libreadline6
      - libreadline6-dev
      - curl
      - git-core
      - zlib1g
      - zlib1g-dev
      - libssl-dev
      - libyaml-dev
      - libsqlite3-0
      - libsqlite3-dev
      - sqlite3
      - libxml2-dev
      - libxslt1-dev
      - autoconf
      - libc6-dev
      - libncurses5-dev
      - automake
      - libtool
      - bison
      - subversion
      - ruby
    - refresh: True

### RVM setup ###
{% for server in salt['pillar.get']('rails_data:servers') %}
{{ "ruby-{0}-{1}".format(server.name, server.ruby) }}:
  rvm.installed:
    - name: {{ server.ruby }}
    - user: {{ salt['pillar.get']('rails_data:user') }}
    - require:
      - pkg: rvm-deps
      - pkg: mri-deps
      - user: {{ salt['pillar.get']('rails_data:user') }}

{{ "gemset-{0}-{1}".format(server.name, server.gemset) }}:
  rvm.gemset_present:
    - name: {{ server.gemset }}
    - ruby: {{ server.ruby }}
    - user: {{ salt['pillar.get']('rails_data:user') }}
    - require:
      - rvm: {{ server.ruby }}
{% endfor %}


bundler-system:
  gem.installed:
    - name: bundler
    - user: {{ salt['pillar.get']('rails_data:user') }}
