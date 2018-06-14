#!/usr/bin/env bash

########################
# include the magic
########################
. ../demo-magic.sh 


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
DEMO_PROMPT="${GREEN} ${CYAN}\W "

#remove resources if they exist already
kubectl delete service nginx
kubectl delete deployment nginx

# hide the evidence
clear


# put your demo awesomeness here
RG=demok8-rg
NAME=demok8-cl

pe "az aks get-credentials --resource-group $RG --name $NAME"

pe "kubectl get nodes"

pe "kubectl run nginx --image nginx --port 80"

pe "kubectl expose deployment nginx --type LoadBalancer --port 80"

pe "kubectl get service"

p "done"


if [ ! -d "stuff" ]; then
  pe "mkdir stuff"
fi

#pe "cd stuff"

#pe "ls"

#p "cat \"something you dont want to really run\""

# show a prompt so as not to reveal our true nature after
# the demo has concluded
