/swapfile:
  cmd.run:
    - name: "fallocate -l 1024M /swapfile && chmod 600 /swapfile && mkswap /swapfile"
    - unless: ls -lh /swapfile
  mount.swap:
    - require:
      - cmd: /swapfile
