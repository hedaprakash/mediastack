mkdir C:\virtualization
cd C:\virtualization
git config --global user.email "ph@gbsssssssssssssssssssssssssss.com"
git config --global user.name "Praeda"
cd C:\virtualization
git clone git@code.ssnc.dev:pheda/olly.git
cd olly
git fetch origin
rm ~/.ssh/known_hosts 

cd C:\virtualization\mediastack
git add . 
git status 
git commit -m "16 set"
# git reset
git push

#get latest refresh
git pull origin main

