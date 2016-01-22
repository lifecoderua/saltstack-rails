rails_data:
  user: deploy
  mysql:
    password: SomeVeryStr0ngPa55worD
  ssh_public_key: PastYourPubKeyHereAndRecieveYourSshAccessToDeployUserWithoutSmsAndRegistration== webowner@example.com  
  servers:
    - exampleone:
      name: exampleone
      ruby: ruby-2.0.0-p247
      gemset: exampleone
      domain: exampleone.com
      db: exampleonedb
    - exampletwo:
      name: exampletwo
      ruby: ruby-2.0.0-p247
      gemset: exampletwo
      domain: exampletwo.com
      db: exampletwodb
    - examplethree:
      name: examplethree
      ruby: ruby-2.2.1
      gemset: examplethree
      domain: examplethree.com
      db: examplethreedb
