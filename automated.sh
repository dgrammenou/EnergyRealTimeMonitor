#phase_0
##clear DB

printf "Phase 0: clear DB!\n"

node ./clear_db/clear_db.js getterforagpt
node ./clear_db/clear_db.js getterforatl
node ./clear_db/clear_db.js getterforff
node ./clear_db/clear_db.js displayforagpt
node ./clear_db/clear_db.js displayforatl
node ./clear_db/clear_db.js displayforff


#phase_1
##create images and npm npm install

printf "Phase 1: create docker images and download packages for each microservice!\n"

for microservice in $@;
do	
		
	printf "%s\n" ${microservice}
	docker build ./${microservice} -t ${microservice}
	npm install 
done       	

#phase_2
##create db
##sudo install pg_dump

#phase_2

printf "Phase 2: setupt kafka broker and zookeeper and make sure that they are alive (check their status)!\n"

docker-compose up -d zoo1
sleep 15
docker-compose up -d kafka1 
docker-compose up -d kafka2
docker-compose up -d kafka3
sleep 5

kafka1_status=$( netstat -at | grep 9092 )
##printf "%s\n"  ${kafka1_status}

while [ ! "$kafka1_status" ]
do
       printf "kafka1 is not alive\n"
       sleep 1
done

printf "kafka1 is alive at port 9092!\n"

kafka2_status=$( netstat -at | grep 9093 )
##printf "%s\n"  ${kafka2_status}

while [ ! "$kafka2_status" ]
do
       printf "kafka2 is not alive\n"
       sleep 1
done

printf "kafka2 is alive at port 9093!\n"

kafka3_status=$( netstat -at | grep 9094 )
##printf "%s\n"  ${kafka3_status}

while [ ! "$kafka3_status" ]
do
       printf "kafka3 is not alive\n"
       sleep 1
done

printf "kafka3 is alive at port 9094!\n"


##phase_3

printf "Phase 3: create topics to kafka brokers, topics needed:agpt, atl, phf!\n"

topic_agpt=$( docker-compose exec kafka1 kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 3 --topic apgt )

if [[ $topic_agpt == *"Created"* ]]
then
        printf "Topic agpt created, next step atl topic!\n"      
fi


if [[ $topic_agpt == *"exists"* ]]
then 
	printf "Topic agpt already exists, next step atl topic!\n"
fi

topic_atl=$( docker-compose exec kafka2 kafka-topics --create --bootstrap-server localhost:9093 --replication-factor 1 --partitions 3 --topic atl )

if [[ $topic_atl == *"Created"* ]]
then
        printf "Topic atl created, next step phf topic!\n"
fi


if [[ $topic_atl == *"exists"* ]]
then
        printf "Topic atl already exists, next step phf topic!\n"
fi

topic_phf=$( docker-compose exec kafka3 kafka-topics --create --bootstrap-server localhost:9094 --replication-factor 1 --partitions 3 --topic phf )

if [[ $topic_phf == *"Created"* ]]
then
        printf "Topic phf created, all topics created\n"
fi


if [[ $topic_phf == *"exists"* ]]
then
        printf "Topic pfh already exists, all topics created!\n"
fi

sleep 5

##phase_4

printf "Phase 4: time to wake up all microservces! \n"

printf "docker-compose up -d!\n"
docker-compose up -d
#printf "Run display microservices!\n"
#docker-compose up -d agpt_display
#docker-compose up -d atl_display
#docker-compose up -d phf_display

#printf "Run getter microsrvices!\n"
#docker-compose up -d agpt_getter
#docker-compose up -d atl_getter
#docker-compose up -d phf_getter


