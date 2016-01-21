user-deploy:
  group.present: []
  user.present:
    - gid: deploy
    - home: /home/deploy
    - groups:
      - sudo
      - deploy

fetch_keys:
  cmd.run:
    - name: gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    - user: deploy
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

### exampleone ###

ruby-2.2.2:
  rvm.installed:
    - default: True
    - user: deploy
    - require:
      - pkg: rvm-deps
      - pkg: mri-deps
      - user: deploy

exampleone:
  rvm.gemset_present:
    - ruby: ruby-2.2.2
    - user: deploy
    - require:
      - rvm: ruby-2.2.2

bundler-system:
  gem.installed:
    - name: bundler
    - user: deploy

### exampletwo ###

ruby-2.0.0-p247:
  rvm.installed:
    - user: deploy
    - require:
      - pkg: rvm-deps
      - pkg: mri-deps
      - user: deploy

exampletwo:
  rvm.gemset_present:
    - ruby: ruby-2.0.0-p247
    - user: deploy
    - require:
      - rvm: ruby-2.0.0-p247

### examplethree ###

examplethree:
  rvm.gemset_present:
    - ruby: ruby-2.2.2
    - user: deploy
    - require:
      - rvm: ruby-2.2.2
