# jenkins-docker-cluster
Modeling a jenkins environment with one master and two workers, each running in a container.

References:
```
svn export https://github.com/CentOS/CentOS-Dockerfiles/trunk/ssh/centos7/Dockerfile
svn export https://github.com/CentOS/CentOS-Dockerfiles/trunk/ssh/centos7/start.sh
```

- Curling to install Jenkins plugins https://gist.github.com/basmussen/8182784

Create user after installation:
```
echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("jenkins", "jenkins")' | java -jar jenkins-cli.jar -auth admin:$(cat /var/jenkins_home/secrets/initialAdminPassword) -s http://localhost:49099/ groovy =
```
