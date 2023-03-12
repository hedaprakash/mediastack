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

ssh hvadmin@10.10.50.233
docker ps -a 
exit

# Proxmox Snapshot
ssh root@10.10.50.101
qm listsnapshot 789
qm delsnapshot 789 pre-sql
qm snapshot 789 post-sql
exit

ssh hvadmin@10.10.50.233
docker pull grafana/grafana-oss:latest
exit

# run it from client machine
dir C:\virtualization\mediastack\ep43-grafana
scp C:\virtualization\mediastack\ep43-grafana\docker-compose.yml hvadmin@10.10.50.233:~/sql-server
ssh hvadmin@10.10.50.233 "cat  ~/sql-server/docker-compose.yml"

ssh hvadmin@10.10.50.233
ls /nfsdocker/grafana
sudo mkdir -p  /nfsdocker/grafana

#docker volumes
docker volume ls

#stop all containers
docker ps -a
docker compose -f ~/sql-server/docker-compose.yml up -d 
#docker compose -f ~/sql-server/docker-compose.yml down 
docker ps 

# Visit the Grafana Web Interface `http://10.10.50.233:5500/`, and login with 
# Grafana's default username and password: `admin`.

# connect to sql server 
# 10.10.50.233:1433

#docker logs grafana
#docker start grafana
sudo docker exec -it grafana "id"

exit

ssh root@10.10.50.101
qm listsnapshot 789
qm delsnapshot 789 pre-sql-server
qm listsnapshot 789
qm snapshot 789 post-sql-server
qm start 789

