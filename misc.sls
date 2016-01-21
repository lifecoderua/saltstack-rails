### Misc Ruby apps dependencies ###

NodeJS repo:
  cmd.wait:
    - name: curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    - watch:
      - pkg: nodejs

nodejs:
  pkg.installed