##!/usr/bin/env bash
login='kobus78'
pwd='fghNg4ts8f'
echo -e "\n####### START: Provision machine for todproof #######\n"

echo 'update package information...'
apt-get update -y

echo 'install networking & development tools...'
apt-get install -y net-tools \
                   build-essential \
                   ntp \
                   apt-transport-https \
                   ca-certificates \
                   apparmor \
                   curl \
                   openssh-server \
                   git \
                   vim

echo 'configure vim with various rails plugins...'
#mkdir -p /root/.vim/autoload /root/.vim/bundle && curl -LSso /root/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
touch /root/.vimrc
echo "set nocompatible" >> /root/.vimrc
echo "filetype off" >> /root/.vimrc
echo "set rtp+=~/.vim/bundle/Vundle.vim" >> /root/.vimrc
echo "call vundle#begin()" >> /root/.vimrc
echo "Plugin 'VundleVim/Vundle.vim'" >> /root/.vimrc
echo "Plugin 'tpope/vim-rails'" >> /root/.vimrc
echo "Plugin 'tpope/vim-sensible'" >> /root/.vimrc
echo "Plugin 'tpope/vim-surround'" >> /root/.vimrc

#echo "execute pathogen#infect()" >> /root/.vimrc
#echo "syntax on" >> /root/.vimrc
#echo "filetype plugin indent on" >> /root/.vimrc
#cd /root/.vim/bundle && \
	#git clone git://github.com/tpope/vim-rails.git
#cd /root/.vim/bundle && \
	#git clone git://github.com/tpope/vim-bundler.git
#cd /root/.vim/bundle && \
	#git clone git://github.com/tpope/vim-sensible.git

echo "call vundle#end()" >> /root/.vimrc
echo "filetype plugin indent on" >> /root/.vimrc

vim +PluginInstall +qall

echo 'add Docker repo to repo list...'
# Based on install information from: https://docs.docker.com/engine/installation/ubuntulinux/
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D >/dev/null 2>&1

cat >/etc/apt/sources.list.d/docker.list <<-EOF
deb https://apt.dockerproject.org/repo ubuntu-trusty main
EOF

echo 'update apt package index...'
apt-get update -y >/dev/null 2>&1

echo 'purge old Docker repo...'
apt-get purge -y lxc-docker >/dev/null 2>&1

echo 'verify apt is pulling correct docker package...'
apt-cache policy docker-engine >/dev/null 2>&1

# Docker recommends linux-image-extra kernel package which allow aufs storage driver
echo 'add support for aufs storage driver...'
apt-get install -y linux-image-extra-$(uname -r) >/dev/null 2>&1

echo 'install Docker...'
apt-get install -y docker-engine >/dev/null 2>&1

echo 'add Docker to startup...'
service docker start

echo 'verify Docker install...'
docker version
docker run hello-world

echo 'install Docker Compose...'
apt-get install -y python-pip >/dev/null 2>&1
pip install docker-compose >/dev/null 2>&1
docker-compose version

echo 'clean up...'
apt-get clean

echo 'create /apps folder...'
mkdir -p /apps

echo 'clone todproof...'
git clone https://$login:$pwd@bitbucket.org/todteam/todproof.git /apps/todproof
#git clone git@bitbucket.org:todteam/todproof.git /apps/todproof

echo 'install heroku cli...'
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo 'configure git for heroku...'
(cd /apps/todproof && git config user.name "Kobus Esterhuysen")
(cd /apps/todproof && git config user.email "kobus78@gmail.com")
(cd /apps/todproof && git config color.ui true)
(cd /apps/todproof && git config core.ignorecase true)
(cd /apps/todproof && git config core.precomposeunicode true)
(cd /apps/todproof && git config remote.heroku.url https://git.heroku.com/todproof.git)
(cd /apps/todproof && git config remote.heroku.fetch +refs/heads/*:refs/remotes/heroku/*)

echo 'migrate database...'
(cd /apps/todproof && docker-compose run --rm web rake db:setup)

echo -e "\n####### END: Provision machine for todproof #######\n\n"
