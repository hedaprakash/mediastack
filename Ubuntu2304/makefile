mkdir c:\virtualization
cd  c:\virtualization
# git clone hedaprakash/mediastack
git clone https://github.com/hedaprakash/mediastack.git
cd mediastack
gci 
# Refresh existing clone
# cd C:\virtualization\mediastack
# git pull origin main
# gci ep40-media-stack  
ssh hvadmin@10.0.83.89
exit
type C:\Users\pheda\.ssh\id_rsa.pub | ssh hvadmin@10.0.83.89 "cat >> ~/.ssh/authorized_keys"
scp C:\Users\pheda\.ssh\id_rsa.pub hvadmin@10.0.83.89:~/.ssh/id_rsa.pub
scp C:\Users\pheda\.ssh\id_rsa hvadmin@10.0.83.89:~/.ssh/id_rsa
ssh hvadmin@10.0.83.89 "cat  ~/.ssh/authorized_keys"

ssh hvadmin@10.0.83.89
# installing libguestfs-tools only required once, prior to first run
sudo apt update -y
sudo apt upgrade -y
sudo apt install libguestfs-tools -y

sudo apt update
sudo apt list --upgradable

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update



sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin


docker --version

# run docker without sudo on ubuntu
# https://docs.docker.com/engine/install/linux-postinstall/
#sudo groupadd docker
#newgrp docker
sudo usermod -aG docker $USER
su - $USER
#reboot is must
sudo reboot


cat "C:\Users\hvadmin\.ssh\config"
Host vmcontainer
    HostName 10.0.83.89
    User hvadmin

# ssh vmcontainer
ssh vmcontainer "hostname"
ssh vmcontainer "id"
ssh vmcontainer "docker ps -a"
ssh vmcontainer "docker pull postgres:latest"
ssh vmcontainer "docker pull adminer:latest"
ssh vmcontainer "docker pull dpage/pgadmin4:latest"
ssh vmcontainer "docker pull grafana/grafana-oss:latest"
ssh vmcontainer "docker pull mcr.microsoft.com/mssql/server:2022-latest"
ssh vmcontainer "docker images"

ssh vmcontainer "mkdir ~/sql-server"
scp C:\virtualization\mediastack\Ubuntu2304\docker-compose.yml vmcontainer:~/sql-server

ssh vmcontainer
sudo apt update -y 
sudo  apt install net-tools -y
sudo apt install nmap -y
# install sqlcmd
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
sudo apt-get update
ACCEPT_EULA=y  \
sudo apt-get install -y --no-install-recommends mssql-tools unixodbc-dev

# sudo apt-get install mssql-tools -y
# sudo apt-get install mssql-tools unixodbc-dev -y
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y postgresql-client
psql --version  

lsb_release -a
exit 
ssh -t vmcontainer 'sudo shutdown  -h now'

ssh vmcontainer 
sudo systemctl status docker

docker ps -a
docker network create mynetwork
docker network ls
docker images --all


sudo rm -rf /nfsdocker
sudo mkdir /nfsdocker
sudo chown 1000:1000 /nfsdocker
#validate owner
ls -l  /
sudo -uhvadmin mkdir -p /nfsdocker/grafana
sudo chown 472:472 /nfsdocker/grafana
ls -l /nfsdocker
sudo mkdir -p /nfsdocker/grafana/datasources
sudo chown 472:472 /nfsdocker/grafana/datasources
ls -l /nfsdocker/grafana
sudo -uhvadmin mkdir -p /nfsdocker/grafana-data
sudo chown 472:472 /nfsdocker/grafana-data
ls -l  /nfsdocker

sudo -uhvadmin mkdir -p /nfsdocker/psdata
sudo -uhvadmin mkdir -p /nfsdocker/pgdata
ls -ltr /nfsdocker

exit
ssh vmcontainer "docker compose -f ~/sql-server/docker-compose.yml up -d "
ssh vmcontainer "docker ps --format '{{.Names}}\t{{.Ports}}'" 

# docker compose -f ~/sql-server/docker-compose.yml down


# connect to postgresql
# 10.0.83.89:5432
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
ip a | grep eth0
# Visit the adminer Web Interface `http://10.0.83.89:10000/`, and login with database 
# Visit the pgadmin4 Web Interface `http://10.0.83.89:5050/`, and login with database 
# Visit the grafana Web Interface `http://10.0.83.89:5500/`, and login with admin/admin


docker exec -t sql1 cat /var/opt/mssql/log/errorlog | grep connection
docker exec -t sql1 cat /var/opt/mssql/log/setup*.log 
docker exec -t sql1 ls -l /var/opt/mssql/log/

docker exec -it sql1 "bash"

/opt/mssql-tools/bin/sqlcmd -S localhost  -W -h-1 -U SA -P "qqqqqq1!"  -Q "SELECT @@SERVERNAME as Host,
    SERVERPROPERTY('ComputerNamePhysicalNetBIOS') as ComputerNamePhysicalNetBIOS,
    SERVERPROPERTY('MachineName') as MachineName,
    SERVERPROPERTY('ServerName') as ServerName;
"

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "qqqqqq1!"  -Q "create database grafana"

docker logs sql1

# docker ps -aq | xargs docker rm -f
docker ps -a 

nmap -p 1433 localhost
nmap -p 1433 127.0.0.1
ip address | grep eth0| grep inet
nmap -p 1433 10.0.83.89
netstat -ano | grep 1433


sqlcmd -S localhost,1433 -U SA -P "qqqqqq1!"  -Q "select @@servername"
sqlcmd -S 10.0.83.89,1433 -U SA -P "qqqqqq1!"  -Q "select @@servername"
PGPASSWORD=mysecretpassword psql -h 10.0.83.89 -p 5432 -d postgres -U postgres -c 'select * from tbl1;'




