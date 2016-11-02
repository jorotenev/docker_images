# download and install docker 
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install docker-engine -y


# Add vagrant user to the docker group
sudo groupadd docker
sudo usermod -aG docker $USER

# install docker-compose
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# make it possible to connect from PyCharm to docker
config_line='DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"'
already_added=$(cat /etc/default/docker | grep $config_line)

if [[ $already_added ]] ; then
	echo ""
else
	 echo $config_line > /etc/default/docker
fi

folder_to_use=$1
if [[ $folder_to_use ]] ; then
	# $1 is the first argument passed to the script 
	cmd="cd $folder_to_use"
	# open the specified folder on ssh-ing into the virtual machine
	echo $cmd >> '/home/vagrant/.bashrc'
fi
# add useful aliases to the bashrc. they are for one-off commands against docker containers.

echo "DO vagrant reload now"