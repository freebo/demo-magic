#!/usr/bin/env bash

########################
# include the magic
########################
. ../demo-magic.sh -n


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
# TYPE_SPEED=20

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
#DEMO_PROMPT="${GREEN} ${CYAN} [\t][\u@\h:\w]\$ "
DEMO_PROMPT="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

#remove resources if they exist already
kubectl delete service nginx >/dev/null 2>&1
kubectl delete deployment nginx >/dev/null 2>&1

# hide the evidence
clear


# put your demo awesomeness here
RG=demok8-rg
NAME=demok8-cl

pe "az aks get-credentials --resource-group $RG --name $NAME"
wait

pe "kubectl get nodes"
wait

pe "kubectl run nginx --image nginx --port 80"
wait

pe "kubectl expose deployment nginx --type LoadBalancer --port 80"
wait

pe "kubectl get service"

p "Done"


if [ ! -d "stuff" ]; then
  pe "mkdir stuff"
fi

#pe "cd stuff"

#pe "ls"

#p "cat \"something you dont want to really run\""

# show a prompt so as not to reveal our true nature after
# the demo has concluded
