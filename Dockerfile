FROM registry.access.redhat.com/rhel7.2
RUN yum repolist --disablerepo=* && \
    yum-config-manager --disable \* > /dev/null && \
    yum-config-manager --enable rhel-7-server-rpms rhel-7-server-extras-rpms rhel-7-server-ose-3.2-rpms > /dev/null
EXPOSE 6343/udp 8087
USER root
RUN yum install java-1.8.0 -y
RUN  curl -o /tmp/sFlowTrend-linux-6_3.rpm  http://www.inmon.com/products/sFlowTrend/downloads/sFlowTrend-linux-6_3.rpm
RUN yum --nogpgcheck localinstall /tmp/sFlowTrend-linux-6_3.rpm -y
ENV foo hellivan
ADD run /opt/sflowtrend-pro/bin/run
RUN chown -R 1001:0 /opt/sflowtrend-pro  && \
    chmod -R ug+rw /opt/sflowtrend-pro && \
    chmod -R +x /opt/sflowtrend-pro/bin/run  && \
    chown -R 1001:0 /var/local/sflowtrend-pro  && \
    chmod -R ug+rw /var/local/sflowtrend-pro 
USER 1001
CMD /opt/sflowtrend-pro/bin/run start

