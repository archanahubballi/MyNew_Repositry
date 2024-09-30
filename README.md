* This is small CICD Demo using jenkins.
* Here we are are creating 3 EC2 instances.One is for jenkins installation, one for SonarQube and one for Docker service deployment.
* First Install the Jenkins on Jenkins server , the  prerequisite to install Jenkins is Java.
       1. sudo apt-update
       2. sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
          https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
          echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
          https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
          /etc/apt/sources.list.d/jenkins.list > /dev/null
       3. sudo apt-get update
       4. sudo apt-get install jenkins

* Once the Jenkins is ready add the Jenkins URL in Github Webhook section and also configure the jenkins URL in System configure section.
* try to build and see whether the jenkins is fulling data from GitHub or not.
* If the build is successful ,Proceed with SonarQube installation.
        1. sudo apt upgrade -y
        2. sudo apt install openjdk-17-jre -y
        3. wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.zip
        4. sudo apt install unzip
        5. unzip sonarqube-9.9.0.zip
        6. /home/ubuntu/sonarqube-9.9.1.69595/bin/linux-x86-64
        7. ./sonar.sh console
* Try to access Sonarqube URL now.
* Once sonarqube is up genenrate the token and cofigure it in Jenkins.
* Try to build now and whetehr Sonrqube is integreated or not.
* 
