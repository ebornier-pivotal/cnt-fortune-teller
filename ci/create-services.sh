#!/bin/bash 
export
cf login -u $CF_USERNAME -p $CF_PASSWORD -a $CF_API -o $CF_ORGANIZATION -s $CF_SPACE --skip-ssl-validation
cf unbind-service cnt-fortune-teller-fortune-service cnt-service-registry
cf unbind-service cnt-fortune-teller-ui cnt-service-registry
cf delete-service -f cnt-service-registry
cf create-service p-service-registry standard cnt-service-registry
while [[ $(cf service cnt-service-registry | grep Status)  == *"progress"* ]]
do
  echo "Registry creation in progress";
done
echo "Registry created"
