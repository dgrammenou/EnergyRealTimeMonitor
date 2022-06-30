#phase_1
##create images

for microservice in $@;
do	
	printf "%s\n" ${microservice}
	docker build ./${microservice}/ -t ${microservice}:v1.0
done       	

#phase_2
##create db
sudo install pg_dump

#phase_3
##dock-compose phase
