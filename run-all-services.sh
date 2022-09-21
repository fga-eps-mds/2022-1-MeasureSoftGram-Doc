#!/bin/bash


# echo '======= CLONING REPOSITORIES ======='
# echo ""
# echo '======= CLONING Core REPO'
# git clone https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Core core

# echo ""
# echo '======= CLONING Service REPO'
# git clone https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Service service

echo ""
echo '======= CLONING FRONT REPO'
git clone https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Front front



# Running Front
echo ""
echo '======= RUNNING Front'
cd front
git branch
docker compose up -d
cd ..

# sleep 1

# # Running Service
# echo ""
# echo '======= RUNNING Service'
# cd service
# docker compose up -d
# cd ..

# sleep 1

# # Running Core
# echo ""
# echo '======= RUNNING Core'
# cd core
# docker compose up -d
# cd ..

# sleep 1


function_check_if_is_running() {
python3 << END
import socket
import os

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(("0.0.0.0", $1))

s.close()
END
}


echo ""
echo '======= CHECKING IF Front is Running'
until function_check_if_is_running 3000; do
    >&2 echo "======= Waiting for Front to be ready"
    cd front
    docker compose kill front
    docker compose up -d
    cd ..
    sleep 2
done
echo "======= Front is UP"






# echo ""
# echo '======= CHECKING IF Service is Running'
# until function_check_if_is_running 8080; do
#     >&2 echo "======= Waiting for Service to be ready"
#     sleep 1
# done
# echo "======= Service is UP"







# echo ""
# echo '======= CHECKING IF Core is Running'
# until function_check_if_is_running 7000; do
#   >&2 echo "======= Waiting for Core to be ready"
#   sleep 1
# done
# echo "======= Core is UP"
# echo ""







# echo ""
# echo '======= SETTING UP measuresoftgram CLI'

# echo '    ======= CREATING ENV'
# python3 -m venv env
# echo '    ======= ACTIVATING ENV'
# source env/bin/activate

# echo '    ======= INSTALLING measuresoftgram'
# pip install measuresoftgram

# echo '======= measuresoftgram CLI IS READY'

# echo ""
# echo 'All ready to use the MeasureSoftGram system!'

# echo 'Create a repositories.json file with the following format:'

# echo '{
#    "organization_name": "fga-eps-mds",

#    "product_name": "MeasureSoftGram",

#    "repositories": [
#       "https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-CLI",
#       "https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Service",
#       "https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Front",
#       "https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Core"
#    ]
# }'

# sleep 2

# echo ""
# echo 'And run the command: measuresoftgram init --host=http://localhost:8080/ repositories.json'

# sleep 1

# echo ""
# echo "After that run the command to import the JSONs files pointing to the directory where the SonarQube JSON files are:"
# echo "measuresoftgram import sonarqube --host=http://localhost:8080/ analytics-raw-data/"
