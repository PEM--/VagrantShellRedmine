# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Name of the node
  config.vm.box = "Redmine"

  # Import a preinstalled Ubuntu Server 13.10
  config.vm.box_url = "https://googledrive.com/host/0B83ZToJ3fGtDcVBKLU1HNTR1bXc/ubuntu-13.10-server-amd64_virtualbox.box"

  # Configure VM as a real server available on the LAN
  #config.vm.network "private_network", ip: "192.168.50.10"
  config.vm.network "public_network", ip: "192.168.1.50"

  # Set specific VirtualBox settings
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  # Check for the latest VirutalBox guest addition
  # NOTE: This requires an installation plugin: "vagrant plugin install vagrant-vbguest"
  #config.vbguest.auto_update = true
  #config.vbguest.auto_reboot = true

  # Synchronized folders
  config.vm.synced_folder "install/", "/srv/"

  # Force VBoxGuestInstallation using a shell provisionner
  #config.vm.provision "shell",
    #inline: "sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions"
  #config.vm.provision "shell",
    #inline: "sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib"
end
