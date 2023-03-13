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
ssh vmcontainer "sudo rm -rf /nfsdocker/postgres"
ssh vmcontainer "sudo mkdir -p /nfsdocker/postgres/data"
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
# Visit the adminor Web Interface `http://10.10.50.233:10000/`, and login with database 
# Visit the pgadmin Web Interface `http://10.10.50.233:5050/`, and login with database 
exit

ssh proxmox "qm listsnapshot 789"
ssh proxmox "qm snapshot 789 post-postgres"
ssh proxmox "qm delsnapshot 789 pre-postgres" 
ssh proxmox "qm delsnapshot 789 post-grafana-sql"
ssh proxmox "qm start 789"
