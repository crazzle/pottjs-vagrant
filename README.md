Vagrant Infrastructure Repository
============

This project contains all scripts to setup a deployment infrastructure for
applications using Docker.
Vagrant is used to provision the three VMs (Jenkins Instance, Docker Registry, Application Node)

The folder "jenkins_jobs" contains two pre-configured jobs that deploy either a
Python or a NodeJS application to the application node.
The folder "jenkins_plugins" contains the plugins needed to run these jobs (e.g. the Git-Plugin).

The "scripts" folder contains all needed bash scripts to bootstrap the provisioning
process for installing docker, jenkins or spin up the registry on the different VMs.


Run Jenkins
-----------

```bash
vagrant up jenkins
```

Run Docker Registry
--------------

```bash
vagrant up registry
```

Run Deployment Node
--------------

```bash
vagrant up node
```
