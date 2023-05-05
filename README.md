# game-2048-deploy
A small clone of [1024](https://play.google.com/store/apps/details?id=com.veewo.a1024), based on [Saming's 2048](http://saming.fr/p/2048/) (also a clone).

Made just for fun. [Play it here!](http://gabrielecirulli.github.io/2048/)

### Screenshot

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/1175750/8614312/280e5dc2-26f1-11e5-9f1f-5891c3ca8b26.png" alt="Screenshot"/>
</p>

That screenshot is fake, by the way. I never reached 2048 :smile:

### Jenkins
###### Setup all credentials
Create multibranch pipeline in Jenkins
Stage
- build - build Docker container
- login - login private DockerHub repo
- push - push image in DockerHub
- deploy - Pull image from DockerHub private repo

### Deploy on AWS EC2
Pull DockerHub image and deploy in AWS EC2 from Jenkins pipeline
We need login in DockerHub private repo drom ec2 instance
```
docker login -u <docker-hub-user>
# for password input dockerhub generated private key
```
### or new EC2
```
sudo yum update
sudo yum install docker
docker --version
sudo service docker start
ps aux | grep docker # or systemctl status docker
# add user docker like sudo
sudo usermod -aG docker $USER
docker login -u <docker-hub-user>
groups
exit
```