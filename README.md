osx-vagrant-sandbox
===================

Vagrant configulation sample. Double click `*.command` file to provisioning, run servers, reset database, etc.

## Demo

 1. Install [VirtualBox](https://www.virtualbox.org/) - easy
 2. Install [Vagrant](http://www.vagrantup.com/) - very easy
 3. Dobule click [start.command](sandbox/bin/start.command)
 4. Wait for a few minutes...
 5. Access http://192.168.33.10:8080/ and you can access Rails through Nginx


## Provisioning

Add script to [provision.sh](sandbox/vm/provision.sh) with version number(+1), and commit.

Ask team members to double click [provision.command](sandbox/bin/provision.command).

The [provision.sh](sandbox/vm/provision.sh) executes only the blocks with new version numbers. The version number is saved to `/root/.provisioning_version`.


## Commands

[sandbox/bin/*.command](sandbox/bin) scripts SSH login to the VM and execute [sandbox/bin/local/*.command](sandbox/bin/local).

```
vagrant ssh -c '/vagrant/sandbox/bin/local/start.command'
```

Also, you can run [sandbox/bin/local/*.command](sandbox/bin/local) directly on OSX.


## Servers

[sandbox/bin/start.command](sandbox/bin/start.command) starts servers using `foreman`.

- https://github.com/ddollar/foreman

See [Procfile](sandbox/Procfile) to see what foreman do.

And you can `foreman start` locally, if you want. Procfile works on both VM and OSX. Just double click [sandbox/bin/local/start.command](sandbox/bin/local/start.command) to start foreman.


## Shared folder

Project root directory mounted to `/vagrant`.

- [Vagrantfile](sandbox/vm/Vagrantfile)

Frontend-engineers, designers, or editors can edit HTML, CSS, JS, templates on their local machine. Any changes can see througe VM immediately.


## Configuration files

- [sandbox/conf](sandbox/conf)

All configuration files should be added to the repository.

Team members fetch the configuration files, restart VM, double click [provision.command](sandbox/bin/provision.command) if required, and all works fine!

Maintenance is not so difficult, because every members can use this sandbox on VM or OSX, in everydays development.
