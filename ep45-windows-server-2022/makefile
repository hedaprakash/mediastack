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
sudo apt update -y && sudo  apt install net-tools -y
sudo apt install nmap -y
# install sqlcmd
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
sudo apt-get update
ACCEPT_EULA=y  \
sudo apt-get install -y --no-install-recommends mssql-tools unixodbc-dev

sudo apt-get install mssql-tools -y
sudo apt-get install mssql-tools unixodbc-dev -y
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

sudo apt-get update && sudo apt-get upgrade -y

nmap -p 22 159.89.176.25

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

sudo apt install docker.io -y
sudo visudo
https://blog.nillsf.com/index.php/2020/06/29/how-to-automatically-start-the-docker-daemon-on-wsl2/

curl -fsSL get.docker.com | bash
sudo usermod -aG docker $USER
su - $USER
sudo apt install telnetd -y
#reboot is must
sudo reboot

wsl
sudo service docker start


service --status-all

sudo systemctl enable docker
-- restart it with 
wsl.exe --shutdown
wsl --shutdown
wsl --update
wsl --setdefault <DistributionName>

wsl -d ubuntu

sudo systemctl status docker
sudo service docker start
ls -l /etc/w*
cat /etc/wsl*
ls C:\Users\hvadmin\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc\LocalState
wsl --list -v
wslconfig /t Ubuntu   # << Terminates the Ubuntu WSL2 instance

C:\Users\hvadmin\AppData\Local\Packages\[distro]\LocalState\[distroPackageName] 

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
docker pull mcr.microsoft.com/mssql/server:2019-latest
docker pull grafana/grafana-oss:9.2.15
docker image inspect grafana/grafana-oss:9.2.15
docker image inspect mcr.microsoft.com/mssql/server:2022-latest 


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
docker ps --filter "name=sql1"
docker ps -a --filter 'exited=137'
docker network inspect --format "{{.ID}}" mynetwork
docker ps --filter network=e70c4db52663319b8b585709434be12cf01ab4331bfc6fd3c3a904b2f0770951
docker ps --filter expose=900-2500/tcp
docker ps --format "{{.ID}}: {{.Command}}"
docker ps --format "{{.Names}}: {{.Ports}}: {{.State}}"
docker ps --format "table {{.ID}}\t{{.Labels}}"

docker restart sql1
docker container prune -f
docker system info
docker exec -t sql1 cat /var/opt/mssql/log/errorlog | grep connection
docker exec -t sql1 cat /var/opt/mssql/log/setup*.log 
docker exec -t sql1 ls -l /var/opt/mssql/log/
cd /var/opt/mssql/log
cat setup*.log
cat errorlog

docker exec -t sql1 cat /var/opt/mssql/log/errorlog | grep connection
docker inspect sql1
sudo docker exec -it sql1 "bash"
cd /var/opt/mssql/log
cat setup*.log
cat errorlog

# service sqlserver start

/opt/mssql-tools/bin/sqlcmd -S localhost  -W -h-1 -U SA -P "Password1Test#"  -Q "SELECT @@SERVERNAME as Host,
    SERVERPROPERTY('ComputerNamePhysicalNetBIOS') as ComputerNamePhysicalNetBIOS,
    SERVERPROPERTY('MachineName') as MachineName,
    SERVERPROPERTY('ServerName') as ServerName;
"

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Password1Test#"  -Q "create database testdb"
exit


docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=tttt234#@" -p 4400:1433 -d mcr.microsoft.com/mssql/server:2019-latest bash

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=<YourStrong!Passw0rd>" -e "MSSQL_PID=Developer" --cap-add SYS_PTRACE -p 1401:1433 -d mcr.microsoft.com/mssql/server:2019-latest

docker ps -a
docker logs silly_lumiere
docker exec -t silly_lumiere cat /var/opt/mssql/log/errorlog | grep connection

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=<YourStrong!Passw0rd>" -e "MSSQL_PID=Developer" --cap-add SYS_PTRACE -p 1401:1433 -d mcr.microsoft.com/mssql/server:2019-latest
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=qqqq2#2222" -e "MSSQL_PID=Developer" --cap-add SYS_PTRACE -p 5401:1433 -d mcr.microsoft.com/mssql/server:2022-latest sql4

cd /var/opt/mssql/log
cat setup*.log
cat errorlog

docker logs gallant_wilson
docker ps -aq | xargs docker rm -f
docker ps -a 

docker exec -t sql2 ls -l /var/opt/mssql/log/
docker logs sql2

docker compose -f docker-compose.yml up -d 
# docker compose -f docker-compose.yml down
docker compose -f docker-compose.yml up -d sql
docker compose -f docker-compose.yml up -d sql2
docker ps -aq | xargs docker rm -f

nmap -p 31000 10.0.86.34
docker run  --name sql1 -d -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=yourStrong##Password" -p 29000:1433 -d mcr.microsoft.com/mssql/server:2022-latest
docker run  --name sql1 -d -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=yourStrong##Password" -p 31000:1433 -d mcr.microsoft.com/mssql/server:2019-latest

docker logs sql1
docker exec -t sql1 ls -l /var/opt/mssql/log/
docker exec -t sql1 ls -l /var/opt/mssql/
docker exec -t sql1 cat /var/opt/mssql/log/errorlog | grep connection
docker exec -t sql1 cat /var/opt/mssql/log/errorlog | grep port
docker exec -t sql1 cat /var/opt/mssql/log/setup*.log 
docker exec -t sql1 cat /var/opt/mssql/log/sqlagentstartup.log
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sql1
telnet 172.18.0.2 1433
telnet 10.0.86.34 1433
nmap -p 1433 localhost
nmap -p 1433 127.0.0.1
ip address | grep inet
nmap -p 1433 172.20.66.20
nmap -p 1433 10.0.86.34


docker run  --name sql2 -d -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=yourStrong##Password" -p 1533:1433 -d mcr.microsoft.com/mssql/server:2019-latest
docker logs sql2
docker exec -t sql2 ls -l /var/opt/mssql/log/
nmap -p 1533 10.0.86.34

winget install sqlcmd


# install sqlcmd
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
sudo apt-get update
sudo apt-get install mssql-tools -y
sudo apt-get install mssql-tools unixodbc-dev -y
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

sqlcmd -S localhost,1433 -U SA -P "Password1Test#"  -Q "select @@servername"
sqlcmd -S 10.0.86.34,1433 -U SA -P "Password1Test#"  -Q "select @@servername"

nmap -p 1433 10.0.86.34
nmap -p 1433 172.18.0.3

docker ps
netstat -ano | grep 1433

# run on powershell not wsl
netstat -ano | findstr :1433
# run under cmd
wmic process where (ParentProcessId=3140 ) get Caption,ProcessId
taskkill /F /PID 3140


