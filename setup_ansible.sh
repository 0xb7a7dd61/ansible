if command -v ansible >/dev/null 2>&1; then
	echo "Ansible already installed"
	exit 0
fi
cwd=$(pwd)
cd /opt
sudo mkdir homebrew
sudo chown $USER homebrew
sudo chgrp admin homebrew
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
cd $cwd

export PATH="/opt/homebrew/bin:$PATH"
brew install ansible
ansible-galaxy collection install community.general
ansible-galaxy collection install community.docker
