# [DEPRACATED - written for ansible 2.8] 
## k3s on raspberry pi's


## This will go from a fresh install of Raspberry Pi OS to a running k3s cluster


### Makefile runs both playbooks
```
default:
		ansible-playbook --user pi --ask-pass change_default_password.yml
		ansible-playbook --ask-pass kubernets_go.yml
```





## Usage
```bash
make
```
---

1.   &emsp;`ansible-playbook --user pi --ask-pass change_default_password.yml`
     -  starts with asking for default ssh password: rapsberry
     -  prompts for new password
     -  changes the raspberry default password with new password of your choice using sha512

2.   &emsp;`ansible-playbook --ask-pass kubernets_go.yml` &emsp; &emsp; *pronounced 'kubernetsss GO!'*
     -   Universal tasks
         1.  authentication
             -   adds ssh key from ansible_user HOME/.ssh/is_rsa.pub
             -   gives pi passwordless sudo
             -   disables password based authentication for ssh
             -   disables root login for ssh
             -   restarts ssh
         2.  update
             -  apt update and apt upgrade
             -  apt autoclean
             -  apt autoremove

         3.  network
             -  sets host name
             -  enables ipv4forwarding
             -  enables ipv6forwarding
             -  flushes ip tables
             -  sets ipv4 legacy tables
             -  sets ipv6 legacy tables
             -  reboots

         4.  configuration
             -  sets en_US local
             -  sets America/Denver timezone
             -  disables swap space
             -  sets gpu memory split to 16MB
             -  sets cgroup
             -  reboots

     -  Master tasks
        -  sets kube config mode to 644
        -  sets k3s install exec no deploy servicelb no deploy traefik (I don't want default load balancer or proxy)
        -  runs the installer script from: &emsp; `https://get.k3s.io`
        -  enables k3s service
        -  waits for node token
        -  gets token
        -  formats and stores token
        -  creates ansible user /.kube
        -  copies the clusters config to ansible user /.kube
        -  points the config to the master node rather than localhost

     -  Worker tasks
        -  sets kube config mode to 644
        -  sets masters node token
        -  runs installer
        -  enables k3s service
