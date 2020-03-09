# Which version of JBoss EAP corresponds to which community JBoss AS / Wildlfly 
# -  https://access.redhat.com/solutions/21906

# https://hub.docker.com/r/jboss/wildfly/tags?name=11.0
FROM jboss/wildfly:11.0.0.Final

USER root
RUN yum install -y patch && yum clean all
USER jboss

# https://access.redhat.com/solutions/19792
# > JBoss EAP does not currently have functionality to compress logs.
# still EAP7, wildfly11
COPY add_logger.patch .
RUN patch -u /opt/jboss/wildfly/standalone/configuration/standalone.xml < add_logger.patch

COPY hello.war /opt/jboss/wildfly/standalone/deployments/hello.war
RUN touch /opt/jboss/wildfly/standalone/deployments/hello.war.dodeploy
