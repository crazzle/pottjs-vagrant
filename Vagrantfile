# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  config.vm.define "jenkins" do |d|
    d.vm.box = "ubuntu/trusty64"
    d.vm.hostname = "jenkins"
    d.vm.network "private_network", ip: "10.100.198.200"
    d.vm.provision :shell, path: "scripts/bootstrap_docker.sh"
    d.vm.provision :shell, path: "scripts/bootstrap_docker_remote_api.sh"
    d.vm.provision :shell, path: "scripts/bootstrap_jenkins.sh"
    d.vm.provision :file, source: "jenkins_jobs", destination: "/var/lib/jenkins/jobs"
    d.vm.provision :file, source: "jenkins_plugins", destination: "/var/lib/jenkins/plugins"
    d.vm.provision :shell, inline: "chown -R jenkins /var/lib/jenkins"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
  config.vm.define "node" do |d|
    d.vm.box = "ubuntu/trusty64"
    d.vm.hostname = "node"
    d.vm.network "private_network", ip: "10.100.198.201"
    d.vm.provision :shell, path: "scripts/bootstrap_docker.sh"
    d.vm.provision :shell, path: "scripts/bootstrap_docker_remote_api.sh"
    d.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end
  config.vm.define "registry" do |d|
    d.vm.box = "ubuntu/trusty64"
    d.vm.hostname = "jenkins"
    d.vm.network "private_network", ip: "10.100.198.202"
    d.vm.provision :shell, path: "scripts/bootstrap_docker.sh"
    d.vm.provision :shell, path: "scripts/bootstrap_docker_registry.sh"
    d.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end
end
