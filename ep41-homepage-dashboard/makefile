ls
cd c:\virtualization
# git clone hedaprakash/mediastack
git clone https://github.com/hedaprakash/mediastack.git
cd mediastack
gci
# Refresh existing clone
# cd C:\virtualization\mediastack
# git pull origin main
# gci ep41-homepage-dashboard 
ghcr.io/benphelps/homepage:latest
# Proxmox Snapshot
ssh root@10.10.50.101
# rollback snapshot
# qm listsnapshot 777
# qm shutdown 777
# qm rollback 777 post-media-stack
# qm start 777

ssh udoc
docker pull ghcr.io/benphelps/homepage:latest
exit

qm listsnapshot 777
qm delsnapshot 777 post-media-stack
qm listsnapshot 777
qm snapshot 777 post-homepage-image
qm start 777
exit


# run it from client machine
ssh udoc "mkdir ~/homepage"
ssh udoc "docker network create mynetwork"
ssh udoc "pwd"
# update docker-compose with right path for config /home/pheda/homepage/config
scp C:\virtualization\mediastack\ep41-homepage-dashboard\docker-compose.yml udoc:~/homepage
ssh udoc "cat  ~/homepage/docker-compose.yml"

ssh udoc
sudo mkdir -p /nfsdocker/homepage/config
docker ps 

docker compose -f ~/homepage/docker-compose.yml up -d 
docker compose -f ~/homepage/docker-compose.yml down 


Summary:
homepage: http://10.10.50.232:3000
ls -l /nfsdocker/homepage/config/
ls -l /nfsdocker/homepage/config/logs
cat /nfsdocker/homepage/config/logs/homepage.log
cat /nfsdocker/homepage/config/bookmarks.yaml

# open another terminal window 
scp C:\virtualization\mediastack\ep41-homepage-dashboard\config\bookmarks.yaml udoc:/nfsdocker/homepage/config

scp C:\virtualization\mediastack\ep41-homepage-dashboard\config\services.yaml udoc:/nfsdocker/homepage/config

scp C:\virtualization\mediastack\ep41-homepage-dashboard\config\widgets.yaml udoc:/nfsdocker/homepage/config


Jackett: http://10.10.50.232:9117/UI/Dashboard admin Password1Test#
Transmission: http://10.10.50.232:9091/transmission/web/ hvadmin Password1Test#
Sonarr: http://10.10.50.232:8989/ hvadmin Password1Test#
Radarr: http://10.10.50.232:7878/ hvadmin Password1Test#
Jellyfin: http://10.10.50.232:8096  hvadmin Password1Test#

APi Keys for Sonarr, Radarr & Jellyfin

ssh root@10.10.50.101
qm listsnapshot 777
qm delsnapshot 777 post-homepage-image
qm listsnapshot 777
qm snapshot 777 post-homepage
qm start 777

