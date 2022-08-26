# basic-microservices

To run microservices application, https://github.com/kkenan/basic-microservices, run following commands:
- docker-compose build // This command will build docker images for all microservices in the repository
- docker-compose up // This command will start the images in separate containers and build and run postresql database in a container

Open a new terminal and run: ./health_check.sh to check that everything is running properly.