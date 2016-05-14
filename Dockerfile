FROM registry.access.redhat.com/rhel7.2
EXPOSE 6343 8087
USER root
RUN yum install java-1.8.0 -y
RUN  curl -o /tmp/sFlowTrend-linux-6_3.rpm  http://www.inmon.com/products/sFlowTrend/downloads/sFlowTrend-linux-6_3.rpm
RUN yum --nogpgcheck localinstall /tmp/sFlowTrend-linux-6_3.rpm -y
ADD run /opt/sflowtrend-pro/bin/run
RUN chown -R 1001:0 /opt/sflowtrend-pro  && \
    chmod -R ug+rw /opt/sflowtrend-pro && \
    chmod -R +x /opt/sflowtrend-pro/bin/run 
USER 1001
CMD /opt/sflowtrend-pro/bin/run start

