# ssh hvadmin@10.0.83.81
ssh nodejs
exit
type C:\Users\pheda\.ssh\id_rsa.pub | ssh nodejs "cat >> ~/.ssh/authorized_keys"
scp C:\Users\pheda\.ssh\id_rsa.pub nodejs:~/.ssh/id_rsa.pub
scp C:\Users\pheda\.ssh\id_rsa nodejs:~/.ssh/id_rsa
ssh nodejs "cat  ~/.ssh/authorized_keys" | clip

sudo apt install npm -y

ssh nodejs "docker pull postgres:latest"
ssh nodejs "docker pull node:16"
docker pull node:8
docker pull node:18
docker pull node:19
docker pull node:20
docker pull mcr.microsoft.com/mssql/server:2022-latest
docker pull grafana/grafana-oss:latest
docker pull dpage/pgadmin4:latest

ssh nodejs "docker pull adminer:latest"
ssh nodejs "docker pull dpage/pgadmin4:latest"
ssh nodejs "docker pull grafana/grafana-oss:latest"
ssh nodejs "docker pull mcr.microsoft.com/mssql/server:2022-latest"
ssh nodejs "docker images"

sudo shutdown -h now

Basic Components of the Application
Dockerfile: Configuration file that instructs the runtime how to build your container
package.json: Configuration file for NodeJS
.dockerignore: Files to ignore when building the container image
server.js: Javascript script to handle inbound requests to the container

ssh nodejs

mkdir compute_webserver 
cd compute_webserver
ssh nodejs "npm install"


New-Item "server.js" -ItemType File 
New-Item "Dockerfile" -ItemType File 
New-Item "package.json" -ItemType File 
New-Item ".dockerignore" -ItemType File 

ssh nodejs 
rm -rf ~/compute_webserver
mkdir ~/compute_webserver

exit

dir C:\virtualization\chatgpt\nodejs\*
scp -r -p C:\virtualization\chatgpt\nodejs\* nodejs:~/compute_webserver/
scp -r C:\virtualization\chatgpt\nodejs\.dockerignore nodejs:~/compute_webserver/
ssh nodejs "ls -l ~/compute_webserver"


docker build -t mynodejs5 .

# if error 
npm cache clean --force


