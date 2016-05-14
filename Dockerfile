FROM registry.access.redhat.com/rhel7.2
EXPOSE 6343 8087
USER root
RUN yum install java-1.8.0 -y
RUN  curl -o /tmp/sFlowTrend-linux-6_3.rpm  http://www.inmon.com/products/sFlowTrend/downloads/sFlowTrend-linux-6_3.rpm
RUN yum --nogpgcheck localinstall /tmp/sFlowTrend-linux-6_3.rpm -y
USER 85

CMD /etc/init.d/sflowtrend-server    

