# how to install a random collection of tools in user directory

## install some helping tools

```
sudo apt install --yes --no-install-recommends jq gettext bash-completion unzip
```

## install aws

```
mkdir -p ~/.local/bin
mkdir -p ~/.local/share
mkdir -p ~/downloads
```

it might require to open a new terminal, since the `~/.local/bin` is added to
path only if it exists.

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "~/downloads/awscliv2.zip"
cd ~/downloads/
unzip awscliv2.zip
aws/install -i ~/.local/share/aws-cli -b ~/.local/bin
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
