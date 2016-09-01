#!/bin/bash 
echo "toto"
cd ..
./mvnw clean package -Dmaven.test.skip=true 

