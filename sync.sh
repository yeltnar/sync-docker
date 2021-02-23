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

rsync -a -e 'ssh -p 23 -o StrictHostKeyChecking=no' pi@$(piip):'/media/pi/TOSHIBA\ EXT/phone/Tasker' $(pwd)
