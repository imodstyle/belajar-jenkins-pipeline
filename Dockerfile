# Use the official Ubuntu as a parent image
FROM ubuntu:latest

# Set environment variables (you can customize these as needed)
ENV JENKINS_AGENT_WORKDIR=/var/jenkins

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget git && \
    rm -rf /var/lib/apt/lists/*

# Download and install Jenkins agent JAR
RUN mkdir -p /usr/share/jenkins && \
    wget -q -O /usr/share/jenkins/agent.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/4.9/remoting-4.9.jar

# Create a directory for Jenkins agent workspace
RUN mkdir -p ${JENKINS_AGENT_WORKDIR}

# Create a non-root user for the Jenkins agent
RUN useradd -c "Jenkins Agent" -d ${JENKINS_AGENT_WORKDIR} -m -s /bin/bash jenkins

# Give the Jenkins user appropriate permissions
RUN chown -R jenkins:jenkins ${JENKINS_AGENT_WORKDIR}

# Set the user for running the Jenkins agent
USER jenkins

# Set the working directory for the Jenkins agent
WORKDIR ${JENKINS_AGENT_WORKDIR}

# Entry point for running the Jenkins agent
ENTRYPOINT ["java", "-jar", "/usr/share/jenkins/agent.jar"]