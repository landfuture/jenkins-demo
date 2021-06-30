#FROM jenkins/jenkins:2.289.1-jdk11
#
# theme-park-jobCOPY plugins.txt /usr/share/jenkins/ref/plugins.txt
# theme-park-jobRUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
# theme-park-job
# theme-park-jobCOPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml
# theme-park-job
# theme-park-jobENV JAVA_OPTS -Djenkins.install.runSetupWizard=false theme-park-job

FROM jenkins/jenkins:2.289.2-jdk11

USER root
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -a -G docker jenkins
USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false