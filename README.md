#if on softlayer, you might need to fix apt
sudo sed -i 's/mirrors.service.networklayer.com\/ubuntu/us.archive.ubuntu.com\/ubuntu\//g' /etc/apt/sources.list

#install docker
sudo apt-get update
sudo apt-get install linux-image-generic-lts-trusty curl git-core ntp fail2ban
curl -sSL https://get.docker.com/ | sh


git clone https://github.com/bitaccess/insight-docker.git
cd insight-docker.git
sudo docker build -t xt.lxc .

#run it to see how it is going
sudo docker run -a stdout --rm=true --name=xt.lxc -p 8333:8333 -v /data/1/.bitcoin:/data/bitcoin xt.lxc
