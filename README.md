# sflowtrend
Docker image for sflow trend


#Perform a oc new-app 
 - oc new-app https://github.com/ivanthelad/sflowtrend.git --strategy=docker
 - oc expose service sflowtrend  --path=/sflowtrend

# Setup statistic collector 
on each machine perform the following. where the target can be either 
 - Route, that is exposing the port 6343-tcp . In the example below its the the router with the port 6343-tcp 
 - ServiceIP (dns name won't work as the host knows nothing about the kube dns )

sudo ovs-vsctl -- --id=@sflow create sflow agent=eth1 target=\"sflowcollector-temp.cloudapps.example.com\" header=128 sampling=32 polling=10 -- set bridge br0 sflow=@sflow


Note the following playbook also sets up the collector on all nodes (bit basic at the mo)
https://github.com/ivanthelad/ansible-aos-scripts/blob/master/playbooks/collector.yml
