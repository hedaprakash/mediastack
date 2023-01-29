ls
cd c:\virtualization
# git clone hedaprakash/mediastack
git clone https://github.com/hedaprakash/mediastack.git
cd mediastack
gci
# Refresh existing clone
# cd C:\virtualization\mediastack
# git pull origin main
# gci ep40-media-stack  

# Proxmox Snapshot
ssh root@10.10.50.101
# rollback snapshot
# qm listsnapshot 777
# qm stop 777
# qm rollback 777  post-image-download 
# qm start 777

qm listsnapshot 777
qm delsnapshot 777 post-image-download
qm listsnapshot 777
qm snapshot 777 post-image-download
exit

ssh hvadmin@10.10.50.232
docker --version
docker images
docker ps 
ls
exit

ssh hvadmin@10.10.50.232 "mkdir ~/media-stack"
scp C:\virtualization\mediastack\ep40-media-stack\docker-compose.yml hvadmin@10.10.50.232:~/media-stack
ssh hvadmin@10.10.50.232 "ls  ~/media-stack/"
ssh hvadmin@10.10.50.232 "cat  ~/media-stack/docker-compose.yml"

ssh hvadmin@10.10.50.232
ls  /nfsdocker
sudo mkdir -p /nfsdocker/transmission/config
sudo mkdir -p /tordown/transmission
sudo mkdir -p /nfsdocker/transmission
sudo mkdir -p /nfsdocker/radarr/config
sudo mkdir -p /movies/newmovdown
sudo mkdir -p /nfsdocker/sonarr/config
sudo mkdir -p /tvshows/newtvdown
sudo mkdir -p /nfsdocker/jackett/config
sudo mkdir -p /nfsdocker/jackett/blackhole
sudo mkdir -p /nfsdocker/jellyfin/config

sudo chown 1000 /movies/newmovdown
sudo chown :1000 /movies/newmovdown
sudo chown 1000 /tvshows/newtvdown
sudo chown :1000 /tvshows/newtvdown


docker network create mynetwork

docker compose -f ~/media-stack/docker-compose.yml up -d 
docker compose -f ~/media-stack/docker-compose.yml down 

First time setup summary:
Jackett: http://10.10.50.232:9117/UI/Dashboard admin Password1Test#
Transmission: http://10.10.50.232:9091/transmission/web/ hvadmin Password1Test#
Sonarr: http://10.10.50.232:8989/ hvadmin Password1Test#
Radarr: http://10.10.50.232:7878/ hvadmin Password1Test#
Jellyfin: http://10.10.50.232:8096  hvadmin Password1Test#

# Open Jackett in browser on http://10.10.50.211:9117. Make sure port 9117 is open in firewall/security group.
Scroll to down and set admin password.

# add indexers named YTS 

Configure Transmission:
Open Transmission in browser using ip address or domain of server ip-address-or-domain:9091 and 
check if UI is accessible.

#2. In backend, Get inside transmission container and run below commands.
docker exec -it transmission bash # Get inside transmission container
mkdir /downloads/movies /downloads/tvshows
# not needed chown 50000:3000 /downloads/movies /downloads/tvshows


#Logoin to radaar 
http://10.10.50.211:7878/

Set username and password. Settings --> General --> Security --> Authentication --> Choose Forms --> Set Username and Password--> Save changes.
hvadmin
Password1Test#

3. Add download client. Setting --> Download clients --> 
Add download clients (+) --> Choose Transmission from options --> 
Add name (transmission) 
Host (transmission) 
Port (9091)
Username (hvadmin) 
and password (Password1Test#) 
Test --> If test is successful
save

# below step failed 
Add indexer
Settings --> Indexers --> 
Add Indexer (+) --> Choose Rarbg --> 
Test --> If test is successful 
Save.

5. Setup media management. 
Settings --> Media Management --> Show Advanced --> 
Check Mark 'Rename Movies' --> 
Check mark 'Delete Empty Folders' --> 
Check mark 'Unmonitor Delete movies' --> 
Add /movies in Root folder --> 
Save changes.

Go to Settings > Indexers > ADD + > Torznab > Name > YTS > 
URL > (GO TO JACKETT ON MAINPAGE COPY “TORZNAB FEED” for this indexer) 
<paste it here> > 
API Key > COPY FROM JACKETT MAIN PAGE TOP RIGHT > 
Set Categories for movies only (no tv) > 
Download Client > Your torrent client! > 
The rest is up to you > Test > Save



Configure Jellyfin:
Open Jellyfin in browser using ip address or domain name of server ip-address-or-domain:8096. 
Make sure firewall rule allows this port.
Setup the Jellyfin as per Jellyfin’s first time setup guide tour. 
Choose preffered language --> Set admin username and password --> 
Setup media library (You can skip this as of now, See next step for process) --> Next, Next and Finish.

Setup media library. Login as admin user --> CLick 3 bars on top-left --> Dashboard under Administration --> Libraries 
--> Add Media Libraries --> Content Type = Movies --> Add Folders (+) --> Choose /movies folder --> OK --> 
Add another media library for TV Shows and select /tvshows folder.
Create new non-admin user. Dashboard --> Users --> Add user (+) --> Add username and password --> Choose libraries to give access --> Save.
You can download jellyfin client for mobile or desktop for streaming media. Or you can also use browser.


docker stop radarr
docker rm radarr
docker logs radarr
docker exec -it radarr bash
docker exec -it transmission bash
docker logs transmission 
chown :group1 file1.txt
chown abc aa

