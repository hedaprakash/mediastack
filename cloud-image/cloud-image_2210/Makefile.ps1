#Download image from:
https://cloud-images.ubuntu.com/
# documentation
https://cloudinit.readthedocs.io/en/latest/topics/modules.html

# images
https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
https://cloud-images.ubuntu.com/kinetic/current/kinetic-server-cloudimg-amd64.img
https://cloud-images.ubuntu.com/lunar/current/kinetic-server-cloudimg-amd64.img


ssh root@10.10.50.101

# installing libguestfs-tools only required once, prior to first run
apt update -y
apt upgrade -y
apt install libguestfs-tools -y

# remove existing image in case last execution did not complete successfully
mkdir ~/cloud-init 
cd ~/cloud-init

qm stop 9600 && qm destroy 9600
# wget https://cloud-images.ubuntu.com/kinetic/current/kinetic-server-cloudimg-amd64.img
qm create 9600 --name "ubuntu-cloud-2210" --memory 4096 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk 9600 /mnt/pve/isos2/template/iso/kinetic-server-cloudimg-amd64.img local-lvm
# qm importdisk 9600 /root/cloud-init/kinetic-server-cloudimg-amd64.img
qm set 9600 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9600-disk-0
qm set 9600 --ide2 local-lvm:cloudinit --boot c --bootdisk scsi0 --serial0 socket --vga serial0
qm resize 9600 scsi0 +20G
qm set 9600 --serial0 socket --vga serial0
qm set 9600 --agent enabled=1
qm set 9600 --ciuser=hvadmin --cipassword=Password1Test#
qm set 9600 --sshkey /root/.ssh/id_rsa.pub
qm set 9600 --ipconfig0 ip=dhcp
#qm set 9600 --ipconfig0 ip=10.10.50.222/24,gw=10.10.50.1
qm template 9600

# verify config
qm cloudinit dump 9600 user

#test init

Exit

scp F:/presentation/ep37_cloud-image/proxmox/cloud-image/ubuntu/userconfig.yaml root@10.10.50.101:/var/lib/vz/snippets/
ssh root@10.10.50.101 "cat /var/lib/vz/snippets/userconfig.yaml"


qm stop 666 && qm destroy 666
qm clone 9600 666 --name vmediastack --full
sed -i "s/testservername/vmediastack/g" /var/lib/vz/snippets/userconfig.yaml
sed -i "s/superadmin/hvadmin/g" /var/lib/vz/snippets/userconfig.yaml
cat /var/lib/vz/snippets/userconfig.yaml
qm set 666 --cicustom "user=local:snippets/userconfig.yaml"
#qm set 666 --sshkey ~/gitwork/ssh/id_rsa.pub
qm set 666  --ipconfig0 ip=10.10.50.232/24,gw=10.10.50.1
qm start 666  && qm wait 666


ssh hvadmin@10.10.50.232

hostname

