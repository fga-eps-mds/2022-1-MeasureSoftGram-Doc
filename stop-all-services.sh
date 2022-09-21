#!/bin/bash

# Running Core
echo ""
echo '======= STOPPING Core CONTAINERS'
cd core
docker compose kill
cd ..

sleep 1

# Running Service
echo ""
echo '======= STOPPING Service'
cd service
docker compose kill
cd ..

sleep 1

# Running Front
echo ""
echo '======= STOPPING Front'
cd front
docker compose kill
cd ..

sleep 1

echo '======= DELETING CLONED REPOSITORIES ======='
sleep 3
echo ""
echo '======= DELETING Core REPO'
rm -rf core

echo ""
echo '======= DELETING Service REPO'
rm -rf service

echo ""
echo '======= DELETING Service REPO'
rm -rf front


echo '    ======= REMOVING CREATED ENV'
deactivate
rm -rf env
