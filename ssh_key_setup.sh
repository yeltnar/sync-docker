firebase_person_id(){
	cat ~/gist/gitignore/firebase_person_id
}

firebase_token(){
	cat ~/gist/gitignore/firebase_token
}

piip(){
	pi_ip=$(curl "https://node.andbrant.com/database?person_id=$(firebase_person_id)&token=$(firebase_token)&data_location=devices.exposed_pi.public_ip_v4"| awk '{print substr($0, 2, length($0) - 2)}')
	echo $pi_ip
}

mkdir -p .ssh

ssh-keygen -f ./.ssh/id_rsa -N "" -C "pi-network $(date)" -t rsa
ls ./.ssh
cat ./.ssh/id_rsa.pub

ssh-copy-id -i ./.ssh/id_rsa -p 23 -f pi@$(piip)

cp -r ~/gist/gitignore .
# this will copy the ssh key that was just added to the remote device 
docker build -t sync-docker . 
rm -rf ./gitignore

rm -rf .ssh
