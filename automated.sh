#phase_1
##create images and npm npm install

for microservice in $@;
do	
	printf "%s\n" ${microservice}
	docker build ./${microservice}/ -t ${microservice}:v1.0
	npm install
done       	

#phase_2
##create db
sudo install pg_dump

#phase_3
##dock-compose phase

docker-compose rm -svf 

docker-compose up -d
sleep 30
#docker-compose up -d
