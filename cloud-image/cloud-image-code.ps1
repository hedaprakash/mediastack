# documentation
https://cloudinit.readthedocs.io/en/latest/topics/modules.html

#Download image from:
https://cloud-images.ubuntu.com/
https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
https://cloud-images.ubuntu.com/kinetic/current/kinetic-server-cloudimg-amd64.img
https://cloud-images.ubuntu.com/lunar/current/kinetic-server-cloudimg-amd64.img


mkdir c:\virtualization\cloud-init 
cd  c:\virtualization\cloud-init 
git clone https://github.com/hedaprakash/mediastack.git

ssh root@10.10.50.101

# installing libguestfs-tools only required once, prior to first run
apt update -y
apt upgrade -y
apt install libguestfs-tools -y

# remove existing image in case last execution did not complete successfully
mkdir ~/cloud-init 
cd ~/cloud-init

qm stop 9601 && qm destroy 9601
wget https://cloud-images.ubuntu.com/kinetic/current/kinetic-server-cloudimg-amd64.img
qm create 9601 --name "ubuntu-cloud-21" --memory 4096 --cores 2 --net0 virtio,bridge=vmbr0
#qm importdisk 9601 /mnt/pve/isos2/template/iso/kinetic-server-cloudimg-amd64.img local-lvm
qm importdisk 9601 /root/cloud-init/kinetic-server-cloudimg-amd64.img local-lvm
qm set 9601 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9601-disk-0
qm set 9601 --ide2 local-lvm:cloudinit --boot c --bootdisk scsi0 
qm resize 9601 scsi0 +20G
qm set 9601 --serial0 socket --vga serial0
qm set 9601 --agent enabled=1
qm set 9601 --ciuser=superadmin --cipassword=Password1Test#
qm set 9601 --ipconfig0 ip=dhcp
#qm set 9601 --ipconfig0 ip=10.10.50.222/24,gw=10.10.50.1
qm template 9601

# verify config
qm cloudinit dump 9601 user

#test init

exit

scp C:/virtualization/cloud-init/mediastack/cloud-image/userconfig.yaml root@10.10.50.101:/var/lib/vz/snippets/
ssh root@10.10.50.101 "cat /var/lib/vz/snippets/userconfig.yaml"

ssh root@10.10.50.101

qm stop 777 && qm destroy 777
qm clone 9601 777 --name vmediastack --full
sed -i "s/testservername/vmediastack/g" /var/lib/vz/snippets/userconfig.yaml
sed -i "s/superadmin/hvadmin/g" /var/lib/vz/snippets/userconfig.yaml
cat /var/lib/vz/snippets/userconfig.yaml
qm set 777 --cicustom "user=local:snippets/userconfig.yaml"
#qm set 777 --sshkey /root/.ssh/id_rsa.pub
qm set 777  --ipconfig0 ip=10.10.50.232/24,gw=10.10.50.1
# qm cloudinit dump 777 user
qm start 777  && qm wait 777
qm start 777 

ssh hvadmin@10.10.50.232

hostname
