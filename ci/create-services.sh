#!/bin/bash 
export
cf login -u $CF_USERNAME -p $CF_PASSWORD -a $CF_API -org $CF_ORGANIZATION -s $CF_SPACE --skip-ssl-validation
cf delete-service -f cnt-service-registry
cf create-service p-service-registry standard cnt-service-registry
