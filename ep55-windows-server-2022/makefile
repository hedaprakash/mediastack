ls
# New clone if you are starting
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

wsl 
wsl --install -d Ubuntu-22.04

wsl --list --verbose
wsl --list --all
wsl --set-version Ubuntu-22.04 2
wsl --set-default-version 2
wsl --set-default Ubuntu-22.04
wsl --list --all
wsl
#wsl -d Ubuntu-22.04
# check OS
lsb_release -a
sudo service docker start

docker ps -a
docker network create mynetwork
docker images
docker pull postgres:latest
docker pull adminer:latest
docker pull dpage/pgadmin4:latest
docker pull mcr.microsoft.com/mssql/server:2022-latest
docker pull grafana/grafana-oss:latest

cd /mnt/c/virtualization/mediastack/ep44-PostgreSQL
docker compose -f docker-compose.yml up -d 
# docker compose -f ~/sql-server/docker-compose.yml down 
docker logs sql1

