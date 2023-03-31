ls
# New clone if you are starting
mkdir c:\virtualization
cd c:\virtualization
git clone https://github.com/hedaprakash/mediastack.git
cd mediastack
gci
# Refresh existing clone
# cd C:\virtualization\mediastack
# git pull origin main
# gci ep43-grafana
#configure git
git config  --global user.email "prakash@starinnovative.com"
git config --global  user.name "Prakash Heda"
git config --global --list

#Agenda
#1. setup host names for quick remote commands execution
#2. Review Docker compose   
#3. Create postgres/adminer/pgadmin4 containers
#4. Tested postgres connectivity 


cat "C:\Users\hvadmin\.ssh\config"
Host vmcontainer
    HostName 10.10.50.233
    User hvadmin

Host proxmox
    HostName 10.10.50.101
    User root
    

ssh proxmox "hostname"
ssh proxmox "id"
ssh vmcontainer "hostname"
ssh vmcontainer "id"
ssh vmcontainer "docker ps -a"

# Proxmox Snapshot
ssh proxmox "qm listsnapshot 789"
# ssh proxmox "qm rollback 789 post-grafana-sql"
# ssh proxmox "qm start 789"
ssh proxmox "qm status 789"

# ssh vmcontainer "sudo rm -rf /nfsdocker/postgres"
ssh vmcontainer "docker ps -a"
ssh vmcontainer "sudo rm -rf /home/hvadmin/psdata"
ssh vmcontainer "sudo mkdir -p /home/hvadmin/psdata"
ssh vmcontainer "docker pull postgres:latest"
ssh vmcontainer "docker pull adminer:latest"
ssh vmcontainer "docker pull dpage/pgadmin4:latest"
ssh vmcontainer "docker images"

ssh proxmox "qm listsnapshot 789"
ssh proxmox "qm snapshot 789 pre-postgres"
ssh proxmox "qm listsnapshot 789"

# run it from client machine
ssh vmcontainer "docker volume ls"
ssh vmcontainer "docker ps -a"
scp C:\virtualization\mediastack\ep44-PostgreSQL\docker-compose.yml vmcontainer:~/sql-server
ssh vmcontainer "docker compose -f ~/sql-server/docker-compose.yml up -d "
ssh vmcontainer "docker ps --format '{{.Names}}\t{{.Ports}}'" 


# connect to postgresql
# 10.10.50.233:5432
# postgres
# mysecretpassword

ssh vmcontainer 
docker exec -it postgres "bash"
su postgres
psql 
\l
\c postgres
CREATE TABLE tbl1(	
	col1 char(20) NOT NULL,
	col2 int NOT NULL
);

insert into tbl1 values('value1',1);
insert into tbl1 values('value2',4);
insert into tbl1 values('value4',3);

select * from tbl1;

\q

exit 
exit 
exit
# Visit the adminer Web Interface `http://10.10.50.233:10000/`, and login with database 
# Visit the pgadmin4 Web Interface `http://10.10.50.233:5050/`, and login with database 

wsl --install

Restart-Computer -force 

wsl 
wsl --install -d Ubuntu-22.04

wsl --list --verbose
wsl --list --all
#wsl --set-version Ubuntu-22.04 2
wsl --set-default-version 2
wsl --set-default Ubuntu-22.04
wsl --list --all
wsl
#wsl -d Ubuntu-22.04
# check OS
lsb_release -a
#Update 
sudo apt update
sudo apt list --upgradable

curl -fsSL get.docker.com | bash
sudo usermod -aG docker $USER
su - $USER
#reboot is must
sudo reboot

wsl
sudo apt-get update && sudo apt-get upgrade -y

sudo service docker start

docker ps -a
docker network create mynetwork
docker images --all
#docker images grafana/grafana
#docker image rm  grafana/grafana-oss
#docker images   grafana/grafana-oss
#docker image inspect grafana/grafana-oss

# docker image history mcr.microsoft.com/mssql/server:2022-latest
# docker image inspect mcr.microsoft.com/mssql/server:2022-latest
# docker image inspect grafana/grafana-oss:9.2.15
# docker pull grafana/grafana:8.3.0-beta2
# docker run -d --name=grafana -p 3000:3000 grafana/grafana

docker ps -a 
docker pull postgres:latest
docker pull adminer:latest
docker pull dpage/pgadmin4:latest
docker pull mcr.microsoft.com/mssql/server:2022-latest
docker pull grafana/grafana-oss:9.2.15
docker image inspect grafana/grafana-oss:9.2.15


cd /mnt/c/virtualization/mediastack/ep45-windows-server-2022
docker compose -f docker-compose.yml up -d 
# docker compose -f docker-compose.yml down
# docker compose -f docker-compose.yml up -d sql
# docker compose logs
# cd /mnt/c/virtualization/mediastack/ep42-sql-server
# docker compose -f docker-compose.yml up -d 
# docker compose -f docker-compose-grafana.yml up -d 
# docker compose -f docker-compose-grafana.yml down
# docker compose -f docker-compose-grafana1.yml up -d 
# docker compose -f docker-compose-grafana1.yml down
docker logs sql1
docker rm sql1
docker rm -f < Container_ID>
docker ps -a 
docker system prune --all
docker system prune -a --containers
docker system prune --help

docker container prune -f

docker system info
docker exec -t sql1 cat /var/opt/mssql/log/errorlog | grep connection

sudo docker exec -it sql1 "bash"

/opt/mssql-tools/bin/sqlcmd -S localhost  -W -h-1 -U SA -P "Password1Test#"  -Q "SELECT @@SERVERNAME as Host,
    SERVERPROPERTY('ComputerNamePhysicalNetBIOS') as ComputerNamePhysicalNetBIOS,
    SERVERPROPERTY('MachineName') as MachineName,
    SERVERPROPERTY('ServerName') as ServerName;
"

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Password1Test#"  -Q "create database testdb"
exit
