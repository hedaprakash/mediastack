ls
cd c:\virtualization
# git clone hedaprakash/mediastack
git clone https://github.com/hedaprakash/mediastack.git
cd mediastack
gci
# Refresh existing clone
# cd C:\virtualization\mediastack
# git pull origin main
# gci ep41-sql-server-dashboard 

scp C:/virtualization/mediastack/cloud-init//userconfig.yaml root@10.10.50.101:/var/lib/vz/snippets/
ssh root@10.10.50.101 "cat /var/lib/vz/snippets/userconfig.yaml"

ssh root@10.10.50.101

qm stop 789 && qm destroy 789
qm clone 9601 789 --name vsqlgrafana --full
sed -i "s/testservername/vsqlgrafana/g" /var/lib/vz/snippets/userconfig.yaml
sed -i "s/superadmin/hvadmin/g" /var/lib/vz/snippets/userconfig.yaml
cat /var/lib/vz/snippets/userconfig.yaml
qm set 789 --cicustom "user=local:snippets/userconfig.yaml"
#qm set 789 --sshkey /root/.ssh/id_rsa.pub
qm set 789  --ipconfig0 ip=10.10.50.233/24,gw=10.10.50.1
# qm cloudinit dump 789 user
qm start 789  && qm wait 789
qm start 789 

# Proxmox Snapshot
ssh root@10.10.50.101
qm listsnapshot 789
qm snapshot 789 pre-docker
# qm shutdown 789
# qm rollback 789 pre-docker
# qm start 789
# qm delsnapshot 789 post-sql-server
exit


#Update 
ssh hvadmin@10.10.50.233
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
#reboot is must
sudo reboot


ssh hvadmin@10.10.50.233
docker ps -a
docker pull mcr.microsoft.com/mssql/server:2022-latest
exit

# Proxmox Snapshot
ssh root@10.10.50.101
qm listsnapshot 789
qm delsnapshot 789 pre-docker
qm listsnapshot 789
qm snapshot 789 pre-sql
exit

# run it from client machine

ssh hvadmin@10.10.50.233 "mkdir ~/sql-server"
dir C:\virtualization\mediastack\ep42-sql-server
scp C:\virtualization\mediastack\ep42-sql-server\docker-compose.yml hvadmin@10.10.50.233:~/sql-server
ssh hvadmin@10.10.50.233 "cat  ~/sql-server/docker-compose.yml"

ssh hvadmin@10.10.50.233

#docker volumes
docker volume ls
# ls C:\programdata\docker\volumes\sqlvolume\_data

#stop all containers
# docker ps -a
#docker stop $(docker ps -a -q)
#docker rm $(docker ps -a -q)

#sudo ls /nfsdocker/
#sudo mkdir -p /nfsdocker/sql-server/config
docker ps -a
docker network create mynetwork
docker compose -f ~/sql-server/docker-compose.yml up -d 
# docker compose -f ~/sql-server/docker-compose.yml down 
docker ps 

docker logs sql1

docker exec -t sql1 cat /var/opt/mssql/log/errorlog | grep connection

docker exec -t sql1 ls /var/opt/mssql   
docker exec -t sql1 ls /var/opt/mssql/log   
docker exec -t sql1 cat /var/opt/mssql/log/core.sqlservr.11_04_2023_19_22_04.9.txt




sudo docker exec -it sql1 "bash"

/opt/mssql-tools/bin/sqlcmd -S localhost  -W -h-1 -U SA -P "Password1Test#"  -Q "SELECT @@SERVERNAME as Host,
    SERVERPROPERTY('ComputerNamePhysicalNetBIOS') as ComputerNamePhysicalNetBIOS,
    SERVERPROPERTY('MachineName') as MachineName,
    SERVERPROPERTY('ServerName') as ServerName;
"

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Password1Test#"  -Q "create database testdb"
exit

ip a | grep inet
docker ps 

# execute on SSMS
CREATE TABLE DEPARTMENT
(
   DEPTCODE   INT,
   DeptName   varCHAR(30),
   LOCATION   VARCHAR(33)
);

CREATE TABLE EMPLOYEE
(
   EmpCode      INT,
   EmpFName     VARCHAR(15),
   EmpLName     VARCHAR(15),
   Job          VARCHAR(45),
   Manager      CHAR(4),
   HireDate     DATE,
   Salary       INT,
   Commission   INT,
   DEPTCODE     INT
);

INSERT INTO DEPARTMENT VALUES (10, 'FINANCE', 'EDINBURGH'),
                              (20,'SOFTWARE','PADDINGTON'),
                              (30, 'SALES', 'MAIDSTONE'),
                              (40,'MARKETING', 'DARLINGTON'),
                              (50,'ADMIN', 'BIRMINGHAM');

INSERT INTO EMPLOYEE  
VALUES (9369, 'TONY', 'STARK', 'SOFTWARE ENGINEER', 7902, '1980-12-17', 2800,0,20),
       (9499, 'TIM', 'ADOLF', 'SALESMAN', 7698, '1981-02-20', 1600, 300,30),    
       (9566, 'KIM', 'JARVIS', 'MANAGER', 7839, '1981-04-02', 3570,0,20),
       (9654, 'SAM', 'MILES', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
       (9782, 'KEVIN', 'HILL', 'MANAGER', 7839, '1981-06-09', 2940,0,10),
       (9788, 'CONNIE', 'SMITH', 'ANALYST', 7566, '1982-12-09', 3000,0,20),
       (9839, 'ALFRED', 'KINSLEY', 'PRESIDENT', 7566, '1981-11-17', 5000,0, 10),
       (9844, 'PAUL', 'TIMOTHY', 'SALESMAN', 7698, '1981-09-08', 1500,0,30),
       (9876, 'JOHN', 'ASGHAR', 'SOFTWARE ENGINEER', 7788, '1983-01-12',3100,0,20),
       (9900, 'ROSE', 'SUMMERS', 'TECHNICAL LEAD', 7698, '1981-12-03', 2950,0, 20),
       (9902, 'ANDREW', 'FAULKNER', 'ANAYLYST', 7566, '1981-12-03', 3000,0, 10),
       (9934, 'KAREN', 'MATTHEWS', 'SOFTWARE ENGINEER', 7782, '1982-01-23', 3300,0,20),
       (9591, 'WENDY', 'SHAWN', 'SALESMAN', 7698, '1981-02-22', 500,0,30),
       (9698, 'BELLA', 'SWAN', 'MANAGER', 7839, '1981-05-01', 3420, 0,30),
       (9777, 'MADII', 'HIMBURY', 'ANALYST', 7839, '1981-05-01', 2000, 200, NULL),
       (9860, 'ATHENA', 'WILSON', 'ANALYST', 7839, '1992-06-21', 7000, 100, 50),
       (9861, 'JENNIFER', 'HUETTE', 'ANALYST', 7839, '1996-07-01', 5000, 100, 50);


SELECT E.EMPFNAME, E.EMPLNAME, E.DEPTCODE,
       D.DEPTNAME, D.LOCATION
       FROM EMPLOYEE E, DEPARTMENT D
       WHERE E.DEPTCODE = D.DEPTCODE
       ORDER BY E.EMPFNAME, D.LOCATION;


sudo docker exec -it sql1 /opt/mssql-tools/bin/sqlcmd \
-S localhost -U SA \

exit
exit

ssh root@10.10.50.101
qm listsnapshot 789
qm delsnapshot 789 pre-sql-server
qm listsnapshot 789
qm snapshot 789 post-sql-server

