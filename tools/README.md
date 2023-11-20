# how to install a random collection of tools in user directory

## starting up

```
mkdir -p ~/.local/bin
mkdir -p ~/.local/share
mkdir -p ~/.local/var
mkdir -p ~/downloads
```

it might require to open a new terminal, since the `~/.local/bin` is added to
path only if it exists on bash start up.

## install some helping tools

```
sudo apt install --yes --no-install-recommends jq gettext bash-completion unzip curl
```

## install aws

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "~/downloads/awscliv2.zip"
cd ~/downloads/
unzip awscliv2.zip
aws/install -i ~/.local/share/aws-cli -b ~/.local/bin

# enable bash completion
echo 'complete -C "~/.local/bin/aws_completer" aws' >> ~/.bash_completion.awscli
```

## install eksctl

```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv -v /tmp/eksctl ~/.local/bin

# enable bash completion
eksctl completion bash >> ~/.bash_completion.eksctl
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion
```

## install kubectl

```
curl --silent --location -o ~/.local/bin/kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl
chmod +x ~/.local/bin/kubectl

# enable bash completion
kubectl completion bash >> ~/.bash_completion.kubectl
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion
```

## docker (this is installed globally in the system)

the docker everyone knows and some people love is in the `docker.io` package.
don't be tricked by the `docker` package.

```
# install docker
sudo apt install docker.io

# add current user to docker group so it won't be necessary to use 'sudo' for docker commands
# this command will require to log out and in again to make effect
sudo usermod -aG docker $USER

# don't know if it's needed. didn't run it yet
sudo systemctl enable --now docker

# check if it's possible to run docker as regular user
docker run hello-world
```

## golang

add to `~/.profile` the following

```
export GOCURR=go1.21.4

export GOROOT=$HOME/.local/share/$GOCURR
export GOPATH=$HOME/.local/var/$GOCURR
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
```

log out and in again. to install golang

```
curl https://storage.googleapis.com/golang/$GOCURR.linux-amd64.tar.gz -o ~/downloads/$GOCURR.linux-amd64.tar.gz
cd ~/downloads && tar xzvf $GOCURR.linux-amd64.tar.gz && mv go $GOROOT && cd -
mkdir -p $GOPATH
```

## docker (communinty edition, latest version)

```
sudo apt update

# install the tools necessary to apt use HTTPS
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common

# add the GPG key for the offical Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg


# add the offical docker repository
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# uninstall old versions of docker (docker.io etc)
sudo apt remove docker docker.io containerd runc

sudo apt update

# install docker community edition
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# add current user to docker group so it won't be necessary to use 'sudo' for docker commands
# this command will require to log out and in again to make effect
sudo usermod -aG docker $USER

# start up the docker service
sudo service docker start

# check if it's possible to run docker as regular user
docker run hello-world
```
