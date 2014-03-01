osx-vagrant-sandbox
===================

Sample for creating development VM for support non-engineer members.

## Demo

 1. Install [VirtualBox](https://www.virtualbox.org/) - easy
 2. Install [Vagrant](http://www.vagrantup.com/) - very easy
 3. Dobule click `[start.command](sandbox/bin/start.command)`
 4. Wait few minutes...
 5. Access http://192.168.33.10:8080/ and you can access Rails through Nginx


## Provisioning

- [provision.sh](sandbox/vm/provision.sh)

Add script to `provision.sh` with version number(+1), and commit.

Ask team members to double click `[provision.command](sandbox/bin/provision.command)`.

`provision.sh` will execute only the block with new version number. The version number is saved to `/root/.provisioning_version`.


## Commands

`sandbox/bin/*.command` scripts SSH login to the VM and execute `sandbox/bin/local/*.command`.

- [sandbox/bin](sandbox/bin)

```
vagrant ssh -c '/vagrant/sandbox/bin/local/start.command'
```

Also, you can run `sandbox/bin/local/*.command` directly on OSX.


## Servers

`[sandbox/bin/start.command](sandbox/bin/start.command)` starts servers using `foreman`.

- https://github.com/ddollar/foreman

And you can `foreman start` locally, if you want. Procfile works on both VM and OSX. `[Procfile](sandbox/Procfile)` can execute `sandbox/bin/local/*.command`. Or just double click `sandbox/bin/local/start.command` to start foreman.

Maintenance is not so difficult, because both engineer and non-engineer members can use this sandbox for everydays development.


## Configuration files

- [sandbox/conf](sandbox/conf)

All configuration files should be added to the repository.

Team members fetch the configuration files, restart VM, and all works fine!
