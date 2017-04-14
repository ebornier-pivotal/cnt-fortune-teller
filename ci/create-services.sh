#!/bin/bash 
cf login -u $CF_USERNAME -p $CF_PASSWORD -a $CF_API -o $CF_ORGANIZATION -s $CF_SPACE --skip-ssl-validation
#cf unbind-service cnt-fortune-teller-fortune-service cnt-service-registry
#cf unbind-service cnt-fortune-teller-ui cnt-service-registry
#cf delete-service -f cnt-service-registry

#cf unbind-service cnt-fortune-teller-ui cnt-config-server
#cf delete-service -f cnt-config-server

cnt_service_registry_created=false

if  [[ $(cf service cnt-service-registry | grep Status)  == *"create succeeded"* ]];
then
  echo "Registry already created";
  cnt_service_registry_created=true
fi

if  [[ $cnt_service_registry_created  == false ]];
then
	cf create-service p-service-registry standard cnt-service-registry
	while [[ $(cf service cnt-service-registry | grep Status)  == *"progress"* ]]
	do
  	echo "Registry creation in progress";
	done
	echo "Registry created"
fi

cnt_config_server_created=false

if  [[ $(cf service cnt-config-server | grep Status)  == *"create succeeded"* ]];
then
  echo "Config Server already created";
  cnt_config_server_created=true
fi

if  [[ $cnt_config_server_created  == false ]];
then
	cf create-service -c '{"git": { "uri": "https://github.com/ebornier-pivotal/CloudNativeTour-config.git" }}' p-config-server standard cnt-config-server
	while [[ $(cf service cnt-config-server | grep Status)  == *"progress"* ]]
	do
  	echo "Config server creation in progress";
	done
	echo "Config server created"
fi
