ls
cd c:\virtualization
# git clone hedaprakash/mediastack
git clone https://github.com/hedaprakash/mediastack.git
cd mediastack
gci -r

git pull origin master
mkdir media-stack
cd media-stack

# Proxmox Snapshot
ssh root@10.10.50.101
qm snapshot <vmid> <snapname> [OPTIONS]
qm list
qm listsnapshot 777
qm stop 777
qm status 777
qm snapshot 777 pre-media-stack
qm listsnapshot 777
qm start 777 
ssh hvadmin@10.10.50.232
mkdir test
touch ~/test22
cat <<EOF >> ~/test22
# test content
EOF
cat  ~/test22
cd ..
ls -ltr 
ssh hvadmin@10.10.50.232
docker images
docker ps -a
docker stop a9c95ab55880
docker rm a9c95ab55880
docker image rm hello-world
docker images
exit
# rollback snapshot
# qm stop 777
# qm rollback <vmid> <snapname>
qm rollback 777 pre-media-stack $$ qm 777 wait
qm config 777
# Delete Proxmox VM Snapshot from CLI
qm listsnapshot 777
qm start 777 
ssh hvadmin@10.10.50.232
ls ~ 
docker images
exit

ssh root@10.10.50.101
# qm delsnapshot <vmid> <snapname> [OPTIONS]
qm listsnapshot 777
qm delsnapshot 777 pre-media-stack
qm listsnapshot 777


# lets test live 
qm snapshot 777 pre-media-stack
qm listsnapshot 777
ssh hvadmin@10.10.50.232
ls
exit

qm listsnapshot 777
qm snapshot 777 pre-image-download
qm listsnapshot 777

ssh hvadmin@10.10.50.232
docker images
docker ps -a
docker stop a9c95ab55880
docker rm a9c95ab55880
docker image rm hello-world

docker pull linuxserver/sonarr:latest
docker pull linuxserver/jellyfin:latest
docker pull linuxserver/radarr:latest
docker pull linuxserver/transmission:latest
docker pull linuxserver/jackett:latest

docker images
docker ps -a 

exit

qm listsnapshot 777
qm delsnapshot 777 pre-image-download
qm snapshot 777 post-image-download
ssh hvadmin@10.10.50.232
docker ps -a 
docker images


ssh hvadmin@10.10.50.232
ls
