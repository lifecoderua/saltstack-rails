deploy:
  group.present: []
  user.present:
    - gid: deploy
    - home: /home/deploy
    - groups:
      - sudo
      - deploy
